#!/usr/bin/env bash
set -euo pipefail

echo "[1/5] Namespace check"
kubectl get ns capa-lab

echo "[2/5] Base workload check"
kubectl -n capa-lab get deploy,svc

echo "[3/5] Rollout check (if CRD installed)"
if kubectl api-resources | grep -q "rollouts.argoproj.io"; then
  kubectl -n capa-lab get rollout
else
  echo "Rollout CRD not found"
fi

echo "[4/5] Workflow check (if CRD installed)"
if kubectl api-resources | grep -q "workflows.argoproj.io"; then
  kubectl -n capa-lab get workflow,workflowtemplate
else
  echo "Workflow CRD not found"
fi

echo "[5/5] Event and Argo CD checks (if CRDs installed)"
if kubectl api-resources | grep -q "eventsources.argoproj.io"; then
  kubectl -n argo-events get eventsource,sensor
fi
if kubectl api-resources | grep -q "applications.argoproj.io"; then
  kubectl -n argocd get application capa-sample-app
fi

echo "Validation complete. Save output to notes/results.md"
