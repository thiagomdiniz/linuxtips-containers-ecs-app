# linuxtips-containers-ecs-app

> Repositório de exemplo de uma aplicação no ECS.

## Load Test

Para executar o teste de carga usando K6, edite o DNS do load balancer no arquivo [index.js](load_test/index.js) conforme o DNS gerado no seu ambiente e execite o script abaixo.  
Nota: precisa de Docker, pois roda o K6 com Docker.

```sh
./load_test/run.sh
```