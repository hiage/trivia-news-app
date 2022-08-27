#!/bin/bash

docker build backend/ -t hiage/backend:staging
docker push hiage/backend:staging
docker build frontend/ -t hiage/frontend:staging
docker push hiage/frontend:staging

