# Threat Model

## Assets

- Kubernetes API and RBAC policy
- Workload secrets and service endpoints
- Namespace boundaries and traffic controls

## Threats

- Credential abuse by over-privileged principals
- Lateral movement from compromised workload
- Privileged container escape attempts

## Controls

- Least-privileged role assignments
- Pod Security Admission restricted policy
- Default-deny network policy with explicit ingress rules
- Secure runtime context (non-root, no privilege escalation, read-only FS)

## Residual Risk

- Cluster-wide controls still depend on admin hygiene outside this namespace scope.
- Supply chain policy is documented but not fully enforced in this lab.
