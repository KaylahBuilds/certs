# KCSA Lab: Kubernetes Security Baseline

## Scenario

You are the platform security owner for a shared cluster. Your task is to establish a baseline that protects workloads while allowing approved operational access.

## Outcomes

- Enforced namespace security posture
- Least-privileged RBAC model
- Network segmentation with explicit allow rules
- Secure runtime defaults for workloads
- Evidence package showing prevention and detection behavior

## Build Sequence

1. Apply namespaces and labels.
2. Apply RBAC resources and verify effective permissions.
3. Apply network policies and validate allow/deny matrix.
4. Deploy secure workload and validate runtime settings.
5. Attempt insecure workload and confirm denial.
6. Apply quotas/limits and test resource control behavior.

## Validation Sequence

- Run scripts/validate.sh
- Capture all outputs in notes/results.md
- Add one failure-and-recovery narrative in notes/what-i-broke-and-fixed.md

## Deliverables

- manifests/security-baseline/*.yaml
- scripts/setup.sh
- scripts/validate.sh
- notes/threat-model.md
- notes/commands.md
- notes/results.md
