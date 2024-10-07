resource "null_resource" "ecr_image_push" {
  provisioner "local-exec" {
    command = <<EOT
      # pull image
      docker pull fidelissauro/chip:v2

      # tag image
      docker tag fidelissauro/chip:v2 ${module.service.aws_ecr_repository_url}:latest

      # ecr auth
      aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${module.service.aws_ecr_repository_url}

      # push image
      docker push ${module.service.aws_ecr_repository_url}:latest
    EOT
  }

  depends_on = [module.service.aws_ecr_repository_url]
}