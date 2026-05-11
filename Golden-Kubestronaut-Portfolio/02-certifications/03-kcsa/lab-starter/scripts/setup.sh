#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST_DIR="$BASE_DIR/manifests/security-baseline"

echo "Applying KCSA security baseline manifests..."
kubectl apply -f "$MANIFEST_DIR/00-namespaces.yaml"
kubectl apply -f "$MANIFEST_DIR/01-rbac.yaml"
kubectl apply -f "$MANIFEST_DIR/02-networkpolicy.yaml"
kubectl apply -f "$MANIFEST_DIR/03-secure-workload.yaml"
kubectl apply -f "$MANIFEST_DIR/05-quotas.yaml"

echo "Waiting for secure workloads..."
kubectl -n kcsa-dev rollout status deploy/api-server --timeout=120s
kubectl -n kcsa-ops wait --for=condition=Ready pod/ops-client --timeout=120s

echo "KCSA baseline applied."
echo "Next: run scripts/validate.sh"
