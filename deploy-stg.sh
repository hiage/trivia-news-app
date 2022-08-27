#!/bin/bash

kubectl create ns staging
helm install -n staging backend-staging helm/backend/ -f helm/backend/values-staging.yaml
helm install -n staging frontend-staging helm/frontend/ -f helm/frontend/values-staging.yaml

