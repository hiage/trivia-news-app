# Trivia News App
[![build](https://github.com/hiage/trivia-news-app/actions/workflows/build-push-dev.yaml/badge.svg)](https://github.com/hiage/trivia-news-app/actions/workflows/build-push-dev.yaml)

Trivia News App containerized application written in python and golang. kubernetes ready application, have 2 services:
- frontend display the backend data. connect with internal DNS kubernetes.
- backend serving REST API for frontend from datasource numbersapi[dot]com

you can run this application from local computer with docker-compose. follow the guide below. 

### Prerequisites
You should have basic knowledge of docker, kubernetes, helm, golang and python, for develop this application.

- docker 
- kubernetes
- kubectl
- helm
- docker-compose

## How to 
#### Kubernetes Environment
*deploy* to *development* command:
```
./deploy-dev.sh
```
*deploy* to *staging* command:
```
./deploy-stg.sh
```
*deploy* to *production* command:
```
./deploy-prd.sh
```


#### Local Environment
run development mode from your local computer with docker-compose:
```
./deploy-local.sh
```
###### Frontend
visit http://localhost:3000
###### Backend
visit http://localhost:8080