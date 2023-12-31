<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.imgur.com/FxL5qM0.jpg" alt="Bot logo"></a>
</p>

<h3 align="center">API Ruby on Rails</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]() [![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> 🤖 RESTful API with Ruby on Rails
    <br> 
</p>

Endpoint API: http://localhost:8002/api/v1
Endpoint DOC: http://localhost:8002/api/v1/api-docs/

## 📝 Table of Contents

- [Rotas](#rotas)
      - [http://localhost:8002/api/v1](#httplocalhost8002apiv1)
      - [http://localhost:8002/api/v1/api-docs/](#httplocalhost8002apiv1api-docs)
    - [Listar todas as páginas](#listar-todas-as-páginas)
  - [Install Docker](#install-docker)
      - [To Install Docker in WSL/2](#to-install-docker-in-wsl2)
    - [Installing](#installing)
    - [Example:](#example)
  - [🏁 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Installing](#installing-1)
        - [Build image:](#build-image)
        - [Compose V2 (para Compose V1 use: docker-compose ...):](#compose-v2-para-compose-v1-use-docker-compose-)
  - [🚀 Deploying your API ](#-deploying-your-api-)
    - [Rotas:](#rotas-1)
  - [⛏️ Built Using ](#️-built-using-)
  - [✍️ Authors ](#️-authors-)
  - [🎉 Acknowledgements ](#-acknowledgements-)

## 🧐 About <a name = "about"></a>

A RESTful API ultimately lives on the Web, or on a communication network where different parties can expose and consume data streams.

## 🎥 Application Sample / Working <a name = "demo"></a>

![Working](https://media.giphy.com/media/20NLMBm0BkUOwNljwv/giphy.gif)

## 💭 How it works <a name = "working"></a>

The entire API is written in Ruby 3.1.1

## 🎈 Usage <a name = "usage"></a>

# Rotas
#### http: //domain/api/v1
### Listar todos recursos
Retorna uma lista de todos os recursos cadastrados.  
**GET** `/api/v1/pages` 

### Obter um recurso específico
Retorna os detalhes de um recurso específico com base no ID fornecido.  
**GET** `/api/v1/pages/:id`
Parâmetros  
- `:id` (obrigatório): O ID do recurso desejado.  

### Criar um novo recurso
Cria um novo recurso com os dados fornecidos.
**POST** `/api/v1/pages`
Parâmetros da Requisição  
- `page` (obrigatório): Um objeto JSON contendo os detalhes do recurso a ser criado.  
Os campos obrigatórios são `title`, `description` e `active`.  
***Exemplo de requisição***
```json
{
  "page": {
    "title": "Novo Artigo",
    "description": "Texto descritivo do novo artigo.",
    "active": true
  }
}
```
### Atualizar uma página existente
Atualiza os detalhes de um recurso existente com base no ID fornecido.  
**PATCH/PUT** `/api/v1/pages/:id`
Parâmetros  
- `:id` (obrigatório): O ID do recurso a ser atualizado.  
Parâmetros da Requisição  
- `page` (obrigatório): Um objeto JSON contendo os detalhes atualizados do recurso. 
Os campos permitidos para atualização são title, description e active.  
***Exemplo de requisição***
```json
{
  "page": {
    "title": "Atualização do artigo",
    "description": "Texto descritivo com atualização desativado.",
    "active": false
  }
}
```
### Excluir uma página
Exclui um recurso existente com base no ID fornecido.  
**DELETE** `/api/v1/pages/:id` 
Parâmetros  
- `:id` (obrigatório): O ID do recurso a ser excluído.

### Erros
A API retorna os respectivos textos de erros, mensagens e validações:  
***Exemplo de respostas:***
```json
{
  "error": "Recurso não encontrado"
}
```
```json
{
  "error": "404 Not Found: Endpoint inexistente para o recurso."
}
```
```json
{
  "message": "Bem-vindo à API RESTful Ruby on Rails"
}
```
```json
{
    "title": [
        "não pode ficar em branco"
    ],
    "description": [
        "não pode ficar em branco"
    ],
    "active": [
        "não está incluído na lista"
    ]
}
```

## Install Docker
```bash
curl https://releases.rancher.com/install-docker/20.10.sh | sh
```
#### To Install Docker in WSL/2
```bash
echo 'sudo gpasswd -a $USER docker' >> ~/.bashrc
echo 'sudo chmod 666 /var/run/docker.sock' >> ~/.bashrc
echo 'sudo /etc/init.d/docker start' >> ~/.bashrc
source ~/.bashrc
```

### Installing

A step by step series of examples that tell you how to get a development env running.

```bash
echo "# api-ruby" >> README.md
git init
git add README.md
git commit -m "Next commit"
git branch -M main
git remote add origin https://github.com/erivandosena/api-ruby.git
git push -u origin main
```

Send to repository

```bash
git remote add origin https://github.com/erivandosena/api-ruby.git
git branch -M main
git push -u origin main
```

Clean Docker Workspace local 

```bash
docker stop $(docker ps -qa)
docker rm -f $(docker ps -qa)
docker rmi -f $(docker images -qa)
docker volume rm -f $(docker volume ls -q)
docker network rm $(docker network ls -q)
docker system prune -fa
```

### Installing Docs  
**Gemfile**  
gem 'grape-swagger-rails'  
gem 'rswag-api'  
gem 'rswag-ui'  

```bash
bundle install
```

**Install generators/customizing**  
```bash
rails g rswag:api:install  
rails g rswag:ui:install  
rails g rswag:ui:custom  
```

### User

```bash
rails g controller User email:string password_digest:string

rails g model User email:string password_digest:string

rails g model ApiKey bearer_id:integer bearer_type:string token:string
```

#### Função HMAC para chave secreta
```bash
API_KEY_HMAC_SECRET_KEY=$(bundle exec bin/rails runner "puts SecureRandom.hex(32)")
```

#### Add user  
```bash
docker exec -it api-ruby bin/rails runner 'User.create!(email: "admin@admin.com", password: "1234")'
```

#### Create Token API  
```bash
curl -v -X POST http://localhost:8002/api/v1/api-keys -u admin@admin.com:1234
```
***Exemplo de resposta:***  
```json
{
	"api_key": "1febeb9cd6babc872e81eefe349062a2"
}
```

#### Modelos de solicitações para API REST  
```bash
curl -v -X GET http://localhost:8002/api/v1/api-keys -H 'Authorization: Bearer 1febeb9cd6babc872e81eefe349062a2'

curl -v -X GET http://localhost:8002/api/v1/users -H 'Authorization: Bearer 1febeb9cd6babc872e81eefe349062a2'

curl -v -X GET http://localhost:8002/api/v1/pages -H 'Authorization: Bearer 1febeb9cd6babc872e81eefe349062a2'

curl -v -X DELETE http://localhost:8002/api/v1/api-keys/1 -H 'Authorization: Bearer 1febeb9cd6babc872e81eefe349062a2'
```

### Example:

> !dict what is love

**Definition:**

Baby, dont hurt me~
Dont hurt me~ no more.

**Example:**

Dude1: Bruh, what is love?
Dude2: Baby, dont hurt me, dont hurt me- no more!
Dude1: dafuq?

**Source:** https://github.com/erivandosena/api-ruby

---

<sup>Beep boop. I am a API. If there are any issues, contact my [Main](https://hub.docker.com/r/erivando/api-ruby)</sup>

<sup>Want to make a similar reddit API? Check out: [GitHub](https://github.com/erivandosena/api-ruby)</sup>

## 🏁 Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites
Docker  
Linux Debian  
Ruby on Rails  
Nginx Server  
Passenger  
OAuth2  
Devise  
Doorkeeper  
Rswag  
Swagger  
PosgreSQL  
Redis  

```cmd
Rails version: 7.0.6
Ruby version: ruby 3.1.1p18 (2022-02-18 revision 53f5fc4236) [x86_64-linux]
```

### Installing

##### Build image:
```bash
docker build -f ./Dockerfile -t erivando/api-ruby:latest --build-arg VERSION=1.0.0 --build-arg COMMIT_SHA=$(git rev-parse HEAD) --no-cache .
docker tag erivando/api-ruby:latest erivando/api-ruby:v1.0.0
docker login
docker push erivando/api-ruby:v1.0.0
```

##### Compose V2 (para Compose V1 use: docker-compose ...):
```bash
docker compose build --no-cache && docker compose up -d
docker compose exec api-ruby bash
docker compose logs -f -t api-ruby
docker compose down
```

## 🚀 Deploying your API <a name = "deployment"></a>

Gerar modelo Page com os atributos `title` (string), `description` (text), `active` (boolean).   
Também irá gerar automaticamente o controlador, as rotas e os testes correspondentes para API. 

```bash
rails new api_crud -v 3.1.1 --api --skip-bundle --version=7.0.6 -d postgresql
rails g scaffold Page title:string description:text active:boolean
```

- **Docker**: https://hub.docker.com/r/erivando/api-ruby

## ⛏️ Built Using <a name = "built_using"></a>

- [PRAW](https://praw.readthedocs.io/en/latest/) - Python Reddit API Wrapper

## ✍️ Authors <a name = "authors"></a>

- [@erivandosena](https://github.com/erivandosena) - Idea & Initial work

## 🎉 Acknowledgements <a name = "acknowledgement"></a>

- Hat tip to anyone whose code was used
- Inspiration
- References