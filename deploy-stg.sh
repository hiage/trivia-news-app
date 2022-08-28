#!/bin/bash
BIRU='\e[34m'
MERAH='\e[91m'
ITEM='\e[30m'
RESET='\e[0m'
IJO='\e[38;5;82m'

TAG='staging'
STAGE='staging'
NAMESPACE='staging'
NAMESPACE_NAME=${1:-$NAMESPACE};
echo -e "$IJO[TASK 1]$RESET  Creating Namespaces $NAMESPACE"
echo
NS=$(kubectl get namespace $NAMESPACE_NAME --ignore-not-found);
if [[ "$NS" ]]; then
  echo "Skipping creation of namespace $NAMESPACE_NAME - already exists";
else
  echo "Creating namespace $NAMESPACE_NAME";
  kubectl create namespace $NAMESPACE_NAME;
fi;
echo -e "$IJO[TASK 1]$RESET  Creating Namespaces $NAMESPACE $IJO[DONE]$RESET"
echo
echo -e "$IJO[TASK 2]$RESET  Build and Push Backend Docker Images"
docker build backend/ -t ${REPO_BACKEND}:${TAG}
docker push ${REPO_BACKEND}:${TAG}
echo -e "$IJO[TASK 2]$RESET  Build and Push Backend Docker Images $IJO[DONE]$RESET"
echo
echo -e "$IJO[TASK 3]$RESET  Build and Push Frontend Docker Images"
docker build frontend/ -t ${REPO_FRONTEND}:${TAG}
docker push ${REPO_FRONTEND}:${TAG}
echo -e "$IJO[TASK 3]$RESET  Build and Push Frontend Docker Images $IJO[DONE]$RESET"
echo
echo -e "$IJO[TASK 4]$RESET  Helm deploy backend-$NAMESPACE"
helm install --set image.repository=${REPO_BACKEND} -n ${NAMESPACE} backend-${STAGE} helm/backend/ -f helm/backend/values-${STAGE}.yaml 
echo -e "$IJO[TASK 4]$RESET  Helm deploy backend-$NAMESPACE $IJO[DONE]$RESET"
echo
echo -e "$IJO[TASK 5]$RESET  Helm deploy frontend-$NAMESPACE"
helm install --set image.repository=${REPO_FRONTEND} -n ${NAMESPACE} frontend-${STAGE} helm/frontend/ -f helm/frontend/values-${STAGE}.yaml
echo -e "$IJO[TASK 5]$RESET  Helm deploy frontend-$NAMESPACE $IJO[DONE]$RESET"
