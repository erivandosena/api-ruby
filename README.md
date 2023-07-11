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

## 📝 Table of Contents

- [📝 Table of Contents](#-table-of-contents)
- [🧐 About ](#-about-)
- [🎥 Application Sample / Working ](#-application-sample--working-)
- [💭 How it works ](#-how-it-works-)
- [🎈 Usage ](#-usage-)
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
- [⛏️ Built Using ](#️-built-using-)
- [✍️ Authors ](#️-authors-)
- [🎉 Acknowledgements ](#-acknowledgements-)

## 🧐 About <a name = "about"></a>

A RESTful API ultimately lives on the Web, or on a communication network where different parties can expose and consume data streams.

## 🎥 Application Sample / Working <a name = "demo"></a>

![Working](https://media.giphy.com/media/20NLMBm0BkUOwNljwv/giphy.gif)

## 💭 How it works <a name = "working"></a>

The API first extracts the word from the comment and then fetches word definitions, part of speech, example and source from the Oxford Dictionary API.

If the word does not exist in the Oxford Dictionary, the Oxford API then returns a 404 response upon which the API then tries to fetch results form the Urban Dictionary API.

The API uses the Pushshift API to fetch comments, PRAW module to reply to comments and Heroku as a server.

The entire API is written in Ruby 3.1.1

## 🎈 Usage <a name = "usage"></a>

To use the API, type GET:

```
http://localhost:8002/api/v1
```
```json
{
   "message":"Welcome to API RESTful Ruby on Rails"
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
docker compose exec api-crud bash
docker compose logs -f -t api-crud
docker compose down
```

## 🚀 Deploying your API <a name = "deployment"></a>

To see an example project on how to deploy your API, please see my own configuration:

- **Docker**: https://hub.docker.com/r/erivando/api-ruby

## ⛏️ Built Using <a name = "built_using"></a>

- [PRAW](https://praw.readthedocs.io/en/latest/) - Python Reddit API Wrapper

## ✍️ Authors <a name = "authors"></a>

- [@erivandosena](https://github.com/erivandosena) - Idea & Initial work

## 🎉 Acknowledgements <a name = "acknowledgement"></a>

- Hat tip to anyone whose code was used
- Inspiration
- References