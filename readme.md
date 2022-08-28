# Trivia News App
[![build](https://github.com/hiage/trivia-news-app/actions/workflows/build-push-dev.yaml/badge.svg)](https://github.com/hiage/trivia-news-app/actions/workflows/build-push-dev.yaml) [![build](https://github.com/hiage/trivia-news-app/actions/workflows/build-push-stg.yaml/badge.svg)](https://github.com/hiage/trivia-news-app/actions/workflows/build-push-stg.yaml) [![build](https://github.com/hiage/trivia-news-app/actions/workflows/build-push-prd.yaml/badge.svg)](https://github.com/hiage/trivia-news-app/actions/workflows/build-push-prd.yaml)

Trivia News App containerized application written in python and golang. kubernetes ready application, have 2 services:
- frontend display the backend data. connect with internal DNS kubernetes.
- backend serving REST API for frontend from datasource numbersapi[dot]com

you can run this application on kubernetes with helm and local computer with docker-compose. follow the guide below. 

### Prerequisites
You should have basic knowledge of docker, kubernetes, helm, golang and python, for develop this application.
please make sure below is installed before deploy the application.
- [docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04) 
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux)
- [helm](https://helm.sh/docs/intro/install/#from-script)
- [docker-compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04)

container images is available here:
- https://hub.docker.com/r/hiage/backend/tags
- https://hub.docker.com/r/hiage/frontend/tags

## How to 

change as needed the repository url ***docker.io/hiage/backend*** and ***docker.io/hiage/frontend*** with your repository. 

run these command before deploy the application.
```
export REPO_BACKEND=docker.io/hiage/backend
export REPO_FRONTEND=docker.io/hiage/frontend
```
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