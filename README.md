= Spring Boot
image:https://github.com/spring-projects/spring-boot/actions/workflows/build-and-deploy-snapshot.yml/badge.svg?branch=main["Build
Status",
link="https://github.com/spring-projects/spring-boot/actions/workflows/build-and-deploy-snapshot.yml?query=branch%3Amain"] image:https://badges.gitter.im/Join
Chat.svg["Chat",link="https://gitter.im/spring-projects/spring-boot?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge"] image:https://img.shields.io/badge/Revved%20up%20by-Develocity-06A0CE?logo=Gradle&labelColor=02303A["Revved up by Develocity", link="https://ge.spring.io/scans?&search.rootProjectNames=Spring%20Boot%20Build&search.rootProjectNames=spring-boot-build"]

:docs: https://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference
:github: https://github.com/spring-projects/spring-boot

# Marvel Heroes Backend

Este é o backend do projeto Marvel Heroes, desenvolvido com Spring Boot e PostgreSQL. O projeto utiliza Docker para
facilitar a configuração e execução do ambiente.

## Pré-requisitos

- Docker
- Docker Compose

## Configuração e Execução

### Passo 1: Iniciar os serviços com Docker Compose

Primeiro, inicie os serviços necessários, como o banco de dados PostgreSQL e o Redis, usando o Docker Compose. Execute o
seguinte comando:

```sh
docker-compose up -d
```

### Passo 2: Executar o projeto

Agora, você pode executar o projeto Spring Boot. Abra o projeto no IntelliJ IDEA ou Eclipse e execute a
classe `MarvelHeroesBackendApplication`.

```sh
./gradlew bootRun --args='--spring.profiles.active=local'
```

Ou, se preferir, você pode construir o projeto e executar o JAR gerado:

```sh
./gradlew build
java -jar build/libs/marvel-heroes-backend-0.0.1-SNAPSHOT.jar --spring.profiles.active=local
```

### License

Project license [MIT license](https://opensource.org/licenses/MIT)