#!/usr/bin/env bash
set -euo pipefail

echo "[1/8] Namespace check"
kubectl get ns platform-system team-a-prod observability

echo "[2/8] Platform API check"
kubectl get crd serviceclaims.platform.example.io
kubectl -n team-a-prod get serviceclaim payments-api

echo "[3/8] Tenant RBAC check"
kubectl auth can-i create deployment -n team-a-prod --as=system:serviceaccount:team-a-prod:team-a-deployer

echo "[4/8] Service workload check"
kubectl -n team-a-prod get deploy,svc

echo "[5/8] Observability pipeline check"
kubectl -n observability get deploy,svc,configmap otel-collector otel-collector-config

echo "[6/8] Optional Argo CD check"
if kubectl api-resources | grep -q "applications.argoproj.io"; then
  kubectl -n argocd get appproject cnpe-tenants
  kubectl -n argocd get application payments-api-prod
fi

echo "[7/8] Optional Kyverno check"
if kubectl api-resources | grep -q "clusterpolicies.kyverno.io"; then
  kubectl get cpol enforce-owner-label enforce-approved-registries
fi

echo "[8/8] Runtime endpoint check"
kubectl -n team-a-prod run tmp-curl --rm -i --restart=Never --image=curlimages/curl:8.8.0 -- \
  curl -sS --max-time 5 http://payments-api.team-a-prod.svc.cluster.local

echo "Validation complete. Save output to notes/results.md"
