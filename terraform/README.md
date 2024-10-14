<!-- BEGIN_TF_DOCS -->
## Terraform

Defina as variáveis do `terraform` com base [nestes arquivos de exemplo](/terraform/environment/dev/).  
Exemplo de utilização do `terraform` referenciando os arquivos `.tfvars`:

```sh
# inicializar terraform
terraform init -backend-config=environment/dev/backend.tfvars

# exibir o plano de execucao, o que sera alterado
terraform plan -var-file=environment/dev/terraform.tfvars
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.69.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service"></a> [service](#module\_service) | /home/thiago/Documents/GitProjects/arq-containers-aws/linuxtips-containers-ecs-service-module | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ecs_task_execution_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_ssm_parameter.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.private_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.private_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.private_subnet_3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.vpc_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | Lista de capacidades especiais necessárias para o serviço, como 'SYS\_ADMIN' para determinados privilégios de sistema. | `list(string)` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do cluster ECS que hospedará o serviço. | `string` | n/a | yes |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Imagem com tag para deployment da aplicação no ECS. | `string` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Lista de variáveis de ambiente que serão passadas às tarefas do serviço. | `list(map(string))` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Região da AWS onde os recursos serão provisionados. | `string` | n/a | yes |
| <a name="input_scale_in_adjustment"></a> [scale\_in\_adjustment](#input\_scale\_in\_adjustment) | n/a | `any` | n/a | yes |
| <a name="input_scale_in_comparison_operator"></a> [scale\_in\_comparison\_operator](#input\_scale\_in\_comparison\_operator) | n/a | `any` | n/a | yes |
| <a name="input_scale_in_cooldown"></a> [scale\_in\_cooldown](#input\_scale\_in\_cooldown) | n/a | `any` | n/a | yes |
| <a name="input_scale_in_cpu_threshold"></a> [scale\_in\_cpu\_threshold](#input\_scale\_in\_cpu\_threshold) | n/a | `any` | n/a | yes |
| <a name="input_scale_in_evaluation_periods"></a> [scale\_in\_evaluation\_periods](#input\_scale\_in\_evaluation\_periods) | n/a | `any` | n/a | yes |
| <a name="input_scale_in_period"></a> [scale\_in\_period](#input\_scale\_in\_period) | n/a | `any` | n/a | yes |
| <a name="input_scale_in_statistic"></a> [scale\_in\_statistic](#input\_scale\_in\_statistic) | n/a | `any` | n/a | yes |
| <a name="input_scale_out_adjustment"></a> [scale\_out\_adjustment](#input\_scale\_out\_adjustment) | n/a | `any` | n/a | yes |
| <a name="input_scale_out_comparison_operator"></a> [scale\_out\_comparison\_operator](#input\_scale\_out\_comparison\_operator) | n/a | `any` | n/a | yes |
| <a name="input_scale_out_cooldown"></a> [scale\_out\_cooldown](#input\_scale\_out\_cooldown) | n/a | `any` | n/a | yes |
| <a name="input_scale_out_cpu_threshold"></a> [scale\_out\_cpu\_threshold](#input\_scale\_out\_cpu\_threshold) | n/a | `any` | n/a | yes |
| <a name="input_scale_out_evaluation_periods"></a> [scale\_out\_evaluation\_periods](#input\_scale\_out\_evaluation\_periods) | n/a | `any` | n/a | yes |
| <a name="input_scale_out_period"></a> [scale\_out\_period](#input\_scale\_out\_period) | n/a | `any` | n/a | yes |
| <a name="input_scale_out_statistic"></a> [scale\_out\_statistic](#input\_scale\_out\_statistic) | n/a | `any` | n/a | yes |
| <a name="input_scale_tracking_cpu"></a> [scale\_tracking\_cpu](#input\_scale\_tracking\_cpu) | n/a | `any` | n/a | yes |
| <a name="input_scale_tracking_requests"></a> [scale\_tracking\_requests](#input\_scale\_tracking\_requests) | n/a | `any` | n/a | yes |
| <a name="input_scale_type"></a> [scale\_type](#input\_scale\_type) | n/a | `any` | n/a | yes |
| <a name="input_service_cpu"></a> [service\_cpu](#input\_service\_cpu) | Quantidade de CPU reservada para o serviço, em unidades definidas pela AWS. | `number` | n/a | yes |
| <a name="input_service_healthcheck"></a> [service\_healthcheck](#input\_service\_healthcheck) | Configurações do health check para o serviço, como caminho e protocolo. | `map(any)` | n/a | yes |
| <a name="input_service_hosts"></a> [service\_hosts](#input\_service\_hosts) | Lista de endereços ou nomes de host atribuídos ao serviço para balanceamento de carga ou exposição. | `list(string)` | n/a | yes |
| <a name="input_service_launch_type"></a> [service\_launch\_type](#input\_service\_launch\_type) | Permite especificar um ou mais capacity providers (FARGATE, FARGATE\_SPOT) e seus pesos. | <pre>list(object({<br>    capacity_provider = string<br>    weight            = number<br>  }))</pre> | n/a | yes |
| <a name="input_service_memory"></a> [service\_memory](#input\_service\_memory) | Quantidade de memória reservada para o serviço, em megabytes. | `number` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Nome do serviço que será usado dentro do cluster. | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | Porta TCP na qual o serviço aceitará tráfego. | `number` | n/a | yes |
| <a name="input_service_task_count"></a> [service\_task\_count](#input\_service\_task\_count) | Número de tarefas que o serviço deve manter em execução simultaneamente. | `number` | n/a | yes |
| <a name="input_ssm_alb"></a> [ssm\_alb](#input\_ssm\_alb) | n/a | `any` | n/a | yes |
| <a name="input_ssm_listener"></a> [ssm\_listener](#input\_ssm\_listener) | ARN do listener de um Application Load Balancer (ALB), armazenado no AWS SSM, que será usado pelo serviço. | `string` | n/a | yes |
| <a name="input_ssm_private_subnet_1"></a> [ssm\_private\_subnet\_1](#input\_ssm\_private\_subnet\_1) | ID da primeira subnet privada, armazenado no AWS SSM, onde o serviço será implantado. | `string` | n/a | yes |
| <a name="input_ssm_private_subnet_2"></a> [ssm\_private\_subnet\_2](#input\_ssm\_private\_subnet\_2) | ID da segunda subnet privada, armazenado no AWS SSM, para implantação do serviço. | `string` | n/a | yes |
| <a name="input_ssm_private_subnet_3"></a> [ssm\_private\_subnet\_3](#input\_ssm\_private\_subnet\_3) | ID da terceira subnet privada, armazenado no AWS SSM, usada para implantação do serviço. | `string` | n/a | yes |
| <a name="input_ssm_vpc_id"></a> [ssm\_vpc\_id](#input\_ssm\_vpc\_id) | ID do VPC armazenado no AWS Systems Manager (SSM) onde o serviço será implantado. | `string` | n/a | yes |
| <a name="input_task_maximum"></a> [task\_maximum](#input\_task\_maximum) | n/a | `any` | n/a | yes |
| <a name="input_task_minimum"></a> [task\_minimum](#input\_task\_minimum) | n/a | `any` | n/a | yes |

## Outputs

No outputs.

## Terraform-Docs

Documentação gerada automaticamente com [terraform-docs](/terraform/.terraform-docs.yml)

```sh
# gerar documentacao do terraform com base nas configuracoes do arquivo '.terraform-docs.yml'
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 /terraform-docs
```
<!-- END_TF_DOCS -->