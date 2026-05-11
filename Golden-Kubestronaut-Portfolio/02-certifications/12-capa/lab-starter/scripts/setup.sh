#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST_DIR="$BASE_DIR/manifests/argo-ecosystem"

echo "This lab requires Argo CD, Rollouts, Workflows, and Events CRDs/controllers."
echo "If needed, install them first using official manifests from each project."

echo "Applying CAPA lab manifests..."
kubectl apply -f "$MANIFEST_DIR/00-namespace.yaml"
kubectl apply -f "$MANIFEST_DIR/01-app-baseline.yaml"

if kubectl api-resources | grep -q "rollouts.argoproj.io"; then
  kubectl apply -f "$MANIFEST_DIR/02-rollout.yaml"
else
  echo "Skipping rollout objects: Rollout CRD not found"
fi

if kubectl api-resources | grep -q "workflows.argoproj.io"; then
  kubectl apply -f "$MANIFEST_DIR/03-workflows.yaml"
else
  echo "Skipping workflow objects: Workflow CRD not found"
fi

if kubectl api-resources | grep -q "eventsources.argoproj.io"; then
  kubectl apply -f "$MANIFEST_DIR/04-events.yaml"
else
  echo "Skipping event objects: EventSource/Sensor CRD not found"
fi

if kubectl api-resources | grep -q "applications.argoproj.io"; then
  kubectl apply -f "$MANIFEST_DIR/05-argocd-application.yaml"
else
  echo "Skipping Argo CD Application: CRD not found"
fi

echo "CAPA setup complete"
