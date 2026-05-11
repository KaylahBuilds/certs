#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST_DIR="$BASE_DIR/manifests/cnpa-platform"

echo "[1/6] Namespace verification"
kubectl get ns platform-system team-a-dev team-b-dev

echo "[2/6] Dry-run validate Backstage catalog artifacts"
kubectl apply --dry-run=client -f "$MANIFEST_DIR/01-backstage-catalog.yaml" >/dev/null

echo "[3/6] Dry-run validate scaffolder template"
kubectl apply --dry-run=client -f "$MANIFEST_DIR/02-scaffolder-template.yaml" >/dev/null

echo "[4/6] KPI config check"
kubectl -n platform-system get configmap platform-kpi-baseline -o yaml >/dev/null

echo "[5/6] Optional Argo CD check"
if kubectl api-resources | grep -q "applications.argoproj.io"; then
  kubectl -n argocd get appproject platform-tenants
fi

echo "[6/6] Optional Kyverno policy check"
if kubectl api-resources | grep -q "clusterpolicies.kyverno.io"; then
  kubectl get cpol require-standard-labels restrict-image-registries-platform
fi

echo "Validation complete. Save output to notes/results.md"
