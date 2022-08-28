#!/bin/bash
BIRU='\e[34m'
MERAH='\e[91m'
ITEM='\e[30m'
RESET='\e[0m'
IJO='\e[38;5;82m'
TAG='development'
STAGE='development'

echo -e "$IJO[TASK 1]$RESET  Build and Push Backend Docker Images"
docker build backend/ -t ${REPO_BACKEND}:${TAG}
docker push ${REPO_BACKEND}:${TAG}
echo -e "$IJO[TASK 1]$RESET  Build and Push Backend Docker Images $IJO[DONE]$RESET"
echo
echo -e "$IJO[TASK 2]$RESET  Build and Push Frontend Docker Images"
docker build frontend/ -t ${REPO_FRONTEND}:${TAG}
docker push ${REPO_FRONTEND}:${TAG}
echo -e "$IJO[TASK 2]$RESET  Build and Push Frontend Docker Images $IJO[DONE]$RESET"
echo
echo -e "$IJO[TASK 3]$RESET Starting..."
docker-compose up -d --force-recreate
sleep 10
echo -e "$IJO[ DONE ]"
echo
echo -e "$IJO[TASK 3]$RESET Status..."
docker-compose ps
echo -e "$IJO[ DONE ]" 
echo
echo -e "$IJO[FRONTEND]$RESET Visit http://127.0.0.1:3000"
echo -e "$IJO[BACKEND]$RESET Visit http://127.0.0.1:8080"