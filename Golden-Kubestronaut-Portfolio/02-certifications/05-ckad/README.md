# CKAD - Certified Kubernetes Application Developer

## Study Plan Snapshot

- Phase: Phase 2
- Prep Window: Days 30-39 (Exam Day 40)
- Exam Type: Performance-based

## Architecture Diagram

```mermaid
flowchart LR
    U[Portfolio Repo] --> A[Application Code]
    A --> B[Container Image]
    B --> C[Kubernetes Workloads]
    C --> D[Traffic Entry Points]
    D --> E[Evidence and Validation]
```

## Infographic - Focus Breakdown

| Domain | Weight / Priority |
|---|---|
| Application Design and Build | 20% |
| Application Deployment | 20% |
| Application Observability and Maintenance | 15% |
| Application Environment Configuration and Security | 25% |
| Services and Networking | 20% |

> Note: Domain weights and competencies can change. Re-check the official exam page before booking.

## Hands-On Lab

### Lab Title

Ship a cloud-native app with secure configuration

### Objective

Build and deploy an app with probes, config, secrets, and deployment strategies.

### Core Tasks

1. Build the baseline environment and document assumptions in `lab-starter/README.md`.
2. Implement the technical controls or workloads in `lab-starter/manifests/` and `lab-starter/scripts/`.
3. Validate end-to-end behavior, including one failure scenario and recovery.
4. Capture commands, outputs, and lessons learned in `lab-starter/notes/`.

### Portfolio Deliverables

- `lab-starter/manifests/app-delivery/`
- `lab-starter/notes/release-strategy.md`
- `lab-starter/notes/commands.md`
- `lab-starter/notes/results.md`
- `lab-starter/notes/what-i-broke-and-fixed.md`

## Study Sprints

- Sprint 1: Learn domains, tools, and command surface.
- Sprint 2: Build the lab from scratch and capture repeatable steps.
- Sprint 3: Run timed practice and close weak areas.

## Hiring Signal

A reviewer should see that you can plan, implement, troubleshoot, and explain CKAD-level work.

Include one blue-green or canary rollout with rollback proof.
