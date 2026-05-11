# CAPA Lab: Argo Ecosystem End-to-End

## Scenario

You are implementing a delivery platform where Git changes, progressive rollout control, and event-driven automation all work together.

## Lab Outcomes

- Argo CD application declaration
- Argo Rollouts canary deployment
- Argo WorkflowTemplate + Workflow execution
- Argo Events webhook-to-workflow trigger path

## Build Sequence

1. Apply namespace and baseline app manifests.
2. Apply rollout and services for progressive delivery.
3. Apply workflow template and submit a workflow run.
4. Apply EventSource and Sensor definitions.
5. Validate controller visibility and object status.

## Validation Sequence

- Run scripts/validate.sh
- Capture resource state in notes/results.md
- Record one rollback or failure simulation in notes/what-i-broke-and-fixed.md

## Important

This lab assumes Argo CRDs/controllers are installed. The setup script provides install hints.
