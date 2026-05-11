# CNPE Capstone Runbook

## Service Onboarding

1. Create namespace and RBAC controls for team.
2. Submit ServiceClaim resource with owner and tier metadata.
3. Register workload in GitOps application path.
4. Validate policy compliance and release readiness.

## Deployment Recovery

- Symptom: Deployment not progressing
- Checks:
  - kubectl describe deployment
  - kubectl get events --sort-by=.lastTimestamp
  - kubectl logs for failing pods
- Recovery:
  - rollback image tag
  - revert policy-breaking manifest
  - re-sync application

## Policy Failure Recovery

- Symptom: Admission denied due to missing labels or image policy
- Recovery:
  - patch metadata labels
  - use approved image registry path
  - re-apply manifest

## Observability Recovery

- Symptom: Missing telemetry
- Checks:
  - collector pod status
  - collector config and logs
  - service endpoint reachability
- Recovery:
  - restart collector deployment
  - fix receiver/exporter config mismatch
