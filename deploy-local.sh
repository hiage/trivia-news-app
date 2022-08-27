#!/bin/bash
BIRU='\e[34m'
MERAH='\e[91m'
ITEM='\e[30m'
RESET='\e[0m'
IJO='\e[38;5;82m'
echo -e "$IJO[TASK 1]$RESET Starting..."
docker-compose up -d
sleep 5
echo -e "$IJO[ DONE ]"
echo
echo -e "$IJO[TASK 2]$RESET Status..."
docker-compose ps
sleep 3
echo -e "$IJO[ DONE ]" 
echo
echo -e "$IJO[FRONTEND]$RESET Visit http://127.0.0.1:3000"
echo -e "$IJO[BACKEND]$RESET Visit http://127.0.0.1:8080"