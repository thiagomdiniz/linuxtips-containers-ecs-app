#!/bin/bash

#
# PSEUDO-PIPELINE
#

# INITIAL SETUP
set -e

export AWS_PROFILE="linuxtips"
export AWS_ACCOUNT="357834747308"
export AWS_REGION="us-east-1"
export AWS_PAGER=""
export APP_NAME="linuxtips-app"
export CLUSTER_NAME="linuxtips-ecs-cluster"
export BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

# CI - APP
echo "1-APP - CI"

cd app/

echo " ->APP - LINT"
docker run -t --rm -v $(pwd):/app -w /app golangci/golangci-lint:v1.61.0 golangci-lint run ./... -E errcheck

echo " ->APP - TEST"
docker run -t --rm -v $(pwd):/app -w /app fidelissauro/apko-go:latest-amd64 go test -v ./...

# CI - TERRAFORM
echo "2-TERRAFORM - CI"

cd ../terraform

echo " ->TERRAFORM - FORMAT CHECK"
terraform fmt -recursive -check

echo " ->TERRAFORM INIT"
terraform init -backend-config=environment/${BRANCH_NAME}/backend.tfvars

echo " ->TERRAFORM - VALIDATE"
terraform validate

# BUILD - APP
cd ../app

echo "3-BUILD"

echo " ->VERSION BUMP"
GIT_COMMIT_HASH=$(git rev-parse --short HEAD)
echo "  ->${GIT_COMMIT_HASH}"

echo " ->BUILD - ECR LOGIN"
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com

echo " ->BUILD - CREATE ECR IF NOT EXISTS"
REPOSITORY_NAME="linuxtips/${APP_NAME}"

set +e

# Verify if repository exists
REPO_EXISTS=$(aws ecr describe-repositories --repository-names ${REPOSITORY_NAME} 2>&1)

if [[ $REPO_EXISTS == *"RepositoryNotFoundException"* ]]; then
  echo " ->Repository ${REPOSITORY_NAME} not found. Creating..."
  
  # Create the repository
  aws ecr create-repository --repository-name ${REPOSITORY_NAME}
  
  if [ $? -eq 0 ]; then
    echo " ->Repository ${REPOSITORY_NAME} created successfully."
  else
    echo " ->Failed to create repository ${REPOSITORY_NAME}."
    exit 1
  fi
else
  echo " ->Repository ${REPOSITORY_NAME} already exists."
fi

set -e

echo " ->BUILD - DOCKER BUILD"
docker build -t app .
REPOSITORY_TAG="${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPOSITORY_NAME}:${GIT_COMMIT_HASH}"
docker tag app:latest ${REPOSITORY_TAG}

# PUBLISH - APP
echo " ->BUILD - DOCKER PUBLISH"
docker push ${REPOSITORY_TAG}

# CD - APPLY TERRAFORM
cd ../terraform

echo "4-DEPLOY"

echo " ->TERRAFORM PLAN"
terraform plan -var-file=environment/${BRANCH_NAME}/terraform.tfvars -var container_image=${REPOSITORY_TAG}

echo " ->TERRAFORM APPLY"
terraform apply -auto-approve -var-file=environment/${BRANCH_NAME}/terraform.tfvars -var container_image=${REPOSITORY_TAG}

echo " ->WAIT DEPLOY"
aws ecs wait services-stable --cluster ${CLUSTER_NAME} --services ${APP_NAME}