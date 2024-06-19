# Marvel Heroes Backend

<div style="text-align: center;">
  <img src="https://www.vectorlogo.zone/logos/springio/springio-ar21.svg" alt="Spring Boot Logo" />
</div>

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

Project license [Apache License 2.0](https://opensource.org/license/apache-2-0)