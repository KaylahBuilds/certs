# KCSA Priority Bootcamp (7 Days)

## Goal

Build fast, exam-ready intuition for Kubernetes security controls while producing a portfolio-grade baseline security implementation.

## Day Plan

1. Day 1: Threat modeling and attack surface mapping
- Build a threat table for control plane, node, workload, and supply chain risk.
- Record trust boundaries and blast-radius assumptions.

2. Day 2: Identity and access controls
- Practice ServiceAccount, Role, RoleBinding, and least privilege design.
- Validate RBAC with kubectl auth can-i checks.

3. Day 3: Workload security baseline
- Apply Pod Security Admission labels and secure securityContext defaults.
- Test rejection paths for privileged or root containers.

4. Day 4: Network segmentation
- Implement default deny and explicit allow policies.
- Validate east-west access rules and DNS exceptions.

5. Day 5: Supply chain and image policy strategy
- Define trusted registries and signature verification approach.
- Map policy intent to enforcement and audit modes.

6. Day 6: Compliance mapping and operations
- Map controls to CIS/organizational policy themes.
- Build an evidence sheet proving each control exists and is tested.

7. Day 7: Timed simulation
- Rebuild the baseline in a fresh namespace.
- Break one control and recover quickly with notes.

## Pass Criteria

- Rebuild the full baseline in under 75 minutes.
- Explain every control using risk language, not just YAML syntax.
- Produce clear evidence in notes/commands.md and notes/results.md.
