# CAPA Component Cheatsheet

## Argo CD

- Problem solved: declarative GitOps application delivery
- Key CRD: Application
- Validation: sync status, health status, drift reconciliation

## Argo Rollouts

- Problem solved: progressive delivery and safer releases
- Key CRD: Rollout
- Validation: canary step progression, pause, promote, undo

## Argo Workflows

- Problem solved: container-native workflow orchestration
- Key CRDs: Workflow, WorkflowTemplate
- Validation: workflow node status, outputs, retries

## Argo Events

- Problem solved: event-driven automation into workflows or K8s objects
- Key CRDs: EventSource, Sensor
- Validation: event receipt, dependency trigger, object creation

## Interview Signal

- Show that you can reason about cross-controller interactions.
- Show failure handling and rollback decision criteria.
