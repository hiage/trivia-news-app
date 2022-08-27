#!/bin/bash

docker build backend/ -t hiage/backend:development
docker push hiage/backend:development
docker build frontend/ -t hiage/frontend:development
docker push hiage/frontend:development

