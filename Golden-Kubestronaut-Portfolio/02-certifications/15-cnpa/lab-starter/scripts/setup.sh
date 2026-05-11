#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST_DIR="$BASE_DIR/manifests/cnpa-platform"

echo "Applying CNPA platform baseline manifests..."
kubectl apply -f "$MANIFEST_DIR/00-namespaces.yaml"
kubectl apply -f "$MANIFEST_DIR/05-kpi-configmap.yaml"

if kubectl api-resources | grep -q "applications.argoproj.io"; then
  kubectl apply -f "$MANIFEST_DIR/03-gitops.yaml"
else
  echo "Skipping AppProject/Application: Argo CD CRD not found"
fi

if kubectl api-resources | grep -q "clusterpolicies.kyverno.io"; then
  kubectl apply -f "$MANIFEST_DIR/04-guardrails.yaml"
else
  echo "Skipping Kyverno ClusterPolicies: CRD not found"
fi

echo "Backstage catalog/template YAML files are design artifacts and should be committed to Git for portal ingestion."

echo "CNPA setup complete"
