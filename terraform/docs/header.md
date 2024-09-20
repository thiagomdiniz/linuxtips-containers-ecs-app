## Terraform

Defina as variáveis do `terraform` com base [nestes arquivos de exemplo](/terraform/environment/dev/).  
Exemplo de utilização do `terraform` referenciando os arquivos `.tfvars`:

```sh
# inicializar terraform
terraform init -backend-config=environment/dev/backend.tfvars

# exibir o plano de execucao, o que sera alterado
terraform plan -var-file=environment/dev/terraform.tfvars
```