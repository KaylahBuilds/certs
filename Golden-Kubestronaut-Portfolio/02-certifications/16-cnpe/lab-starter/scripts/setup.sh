#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST_DIR="$BASE_DIR/manifests/cnpe-platform"

echo "Applying CNPE capstone baseline..."
kubectl apply -f "$MANIFEST_DIR/00-namespaces.yaml"
kubectl apply -f "$MANIFEST_DIR/01-rbac-tenancy.yaml"
kubectl apply -f "$MANIFEST_DIR/02-platform-api-crd.yaml"
kubectl apply -f "$MANIFEST_DIR/03-platform-claim.yaml"
kubectl apply -f "$MANIFEST_DIR/06-otel-collector.yaml"
kubectl apply -f "$MANIFEST_DIR/07-sample-service.yaml"

if kubectl api-resources | grep -q "applications.argoproj.io"; then
  kubectl apply -f "$MANIFEST_DIR/04-gitops.yaml"
else
  echo "Skipping AppProject/Application: Argo CD CRD not found"
fi

if kubectl api-resources | grep -q "clusterpolicies.kyverno.io"; then
  kubectl apply -f "$MANIFEST_DIR/05-kyverno-enforce.yaml"
else
  echo "Skipping Kyverno policies: CRD not found"
fi

echo "CNPE capstone setup complete"
