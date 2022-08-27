#!/bin/bash
kubectl create ns production
helm install -n production backend-production helm/backend/ -f helm/backend/values-production.yaml
helm install -n production frontend-production helm/frontend/ -f helm/frontend/values-production.yaml

