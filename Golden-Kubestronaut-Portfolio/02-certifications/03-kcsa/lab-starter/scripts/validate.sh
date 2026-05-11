#!/usr/bin/env bash
set -euo pipefail

MANIFEST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/manifests/security-baseline"

echo "[1/5] RBAC check: app-reader can list pods"
kubectl auth can-i list pods -n kcsa-dev --as=system:serviceaccount:kcsa-dev:app-reader

echo "[2/5] RBAC check: app-reader cannot read secrets"
kubectl auth can-i get secrets -n kcsa-dev --as=system:serviceaccount:kcsa-dev:app-reader

echo "[3/5] Pod security check: insecure workload should be denied"
set +e
kubectl apply -f "$MANIFEST_DIR/04-insecure-workload.yaml"
rc=$?
set -e
if [[ $rc -eq 0 ]]; then
  echo "WARNING: insecure pod was admitted. Verify Pod Security Admission labels and cluster policy."
else
  echo "Expected deny observed for insecure pod."
fi

echo "[4/5] Network policy check: ops client can reach api-server"
kubectl -n kcsa-ops exec ops-client -- sh -c 'curl -sS --max-time 5 http://api-server.kcsa-dev.svc.cluster.local:8080 >/dev/null && echo allowed'

echo "[5/5] Security context check: deployment uses non-root and read-only root filesystem"
kubectl -n kcsa-dev get pod -l app=api-server -o jsonpath='{.items[0].spec.containers[0].securityContext}'
echo

echo "Validation completed. Copy output into notes/results.md"
