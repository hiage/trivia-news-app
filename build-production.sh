#!/bin/bash

docker build backend/ -t hiage/backend:production
docker push hiage/backend:production
docker build frontend/ -t hiage/frontend:production
docker push hiage/frontend:production

