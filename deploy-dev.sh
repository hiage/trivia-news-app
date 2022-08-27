#!/bin/bash
kubectl create ns development
helm install -n development backend-development helm/backend/ -f helm/backend/values-development.yaml
helm install -n development frontend-development helm/frontend/ -f helm/frontend/values-development.yaml

