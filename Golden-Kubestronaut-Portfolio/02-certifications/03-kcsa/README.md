# KCSA - Kubernetes and Cloud Native Security Associate

## Study Plan Snapshot

- Phase: Phase 1
- Prep Window: Days 14-20 (Exam Day 21)
- Exam Type: Multiple-choice

## Architecture Diagram

```mermaid
flowchart LR
    U[Portfolio Repo] --> A[Security Controls]
    A --> B[Kubernetes Control Plane]
    B --> C[Workload Security]
    C --> D[Compliance Mapping]
    D --> E[Evidence and Validation]
```

## Infographic - Focus Breakdown

| Domain | Weight / Priority |
|---|---|
| Overview of Cloud Native Security | 14% |
| Cluster Component Security | 22% |
| Kubernetes Security Fundamentals | 22% |
| Kubernetes Threat Model | 16% |
| Platform Security | 16% |
| Compliance and Security Frameworks | 10% |

> Note: Domain weights and competencies can change. Re-check the official exam page before booking.

## Hands-On Lab

### Lab Title

Secure a baseline cluster against common threats

### Objective

Apply baseline controls across identity, policy, networking, and supply chain concepts.

### Core Tasks

1. Build the baseline environment and document assumptions in `lab-starter/README.md`.
2. Implement the technical controls or workloads in `lab-starter/manifests/` and `lab-starter/scripts/`.
3. Validate end-to-end behavior, including one failure scenario and recovery.
4. Capture commands, outputs, and lessons learned in `lab-starter/notes/`.

### Portfolio Deliverables

- `lab-starter/manifests/security-baseline/`
- `lab-starter/notes/threat-model.md`
- `lab-starter/notes/commands.md`
- `lab-starter/notes/results.md`
- `lab-starter/notes/what-i-broke-and-fixed.md`

## Study Sprints

- Sprint 1: Learn domains, tools, and command surface.
- Sprint 2: Build the lab from scratch and capture repeatable steps.
- Sprint 3: Run timed practice and close weak areas.

## Hiring Signal

A reviewer should see that you can plan, implement, troubleshoot, and explain KCSA-level work.

Build a short threat model table and map each control to a mitigation.
