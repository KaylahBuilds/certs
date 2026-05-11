# KCSA Threat Model and Control Map

## Threat Areas

- Control plane abuse from over-privileged credentials
- Lateral movement between workloads
- Container breakout due to weak runtime controls
- Untrusted images entering cluster runtime
- Secrets exposure from broad RBAC grants

## Control Set Implemented In This Lab

- Least-privilege RBAC using namespace-scoped RoleBindings
- Pod Security Admission with restricted enforcement
- NetworkPolicy default-deny + explicit allow paths
- ResourceQuota and LimitRange to prevent noisy-neighbor abuse
- Non-root, read-only, privilege-dropped workload defaults

## Validation Questions

- Can a low-privilege service account read secrets?
- Can unauthorized namespaces reach protected workloads?
- Are insecure pods rejected before scheduling?
- Are quota and limit constraints actively enforced?

## Evidence Expectations

- RBAC command outputs with allowed/denied examples
- Pod admission failures for insecure manifests
- Connectivity matrix for network segmentation
- Security context proof from running pod specs
