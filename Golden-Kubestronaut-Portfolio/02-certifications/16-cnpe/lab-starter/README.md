# CNPE Lab: Platform Engineering Capstone

## Scenario

You are building a secure internal platform that allows teams to self-serve service onboarding while enforcing policy and providing reliable operations visibility.

## Lab Outcomes

- Platform API contract for service onboarding
- Namespace tenancy and RBAC boundaries
- GitOps project/application delivery model
- Enforced policy controls for workload governance
- OpenTelemetry collector baseline for operations insight

## Build Sequence

1. Apply namespaces and RBAC tenancy model.
2. Apply platform API CRD and sample service claim.
3. Apply GitOps project and application objects.
4. Apply policy controls and test enforcement behavior.
5. Deploy observability collector and workload.
6. Capture end-to-end runbook evidence.

## Validation Sequence

- Run scripts/validate.sh
- Save outputs to notes/results.md
- Document one failed deployment scenario in notes/what-i-broke-and-fixed.md
