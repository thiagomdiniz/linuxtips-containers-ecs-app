region = "us-east-1"

cluster_name = "linuxtips-ecs-cluster"

service_name = "chip"

service_port = 8080

service_cpu = 256

service_memory = 512

ssm_vpc_id = "/linuxtips-vpc/vpc/vpc_id"

ssm_listener = "/linuxtips/ecs/lb/listener"

ssm_private_subnet_1 = "/linuxtips-vpc/vpc/subnet_private_1a"

ssm_private_subnet_2 = "/linuxtips-vpc/vpc/subnet_private_1b"

ssm_private_subnet_3 = "/linuxtips-vpc/vpc/subnet_private_1c"