# ICA - Istio Certified Associate

## Study Plan Snapshot

- Phase: Phase 3
- Prep Window: Days 62-67 (Exam Day 68)
- Exam Type: Multiple-choice

## Architecture Diagram

```mermaid
flowchart LR
    U[Portfolio Repo] --> A[Mesh Control Plane]
    A --> B[Service-to-Service Traffic]
    B --> C[Security Policy]
    C --> D[Traffic Analysis]
    D --> E[Evidence and Validation]
```

## Infographic - Focus Breakdown

| Domain | Weight / Priority |
|---|---|
| Installation Upgrades and Configuration | 20% |
| Traffic Management | 35% |
| Securing Workloads | 25% |
| Troubleshooting | 20% |
| Hands-On Scenarios | High |

> Note: Domain weights and competencies can change. Re-check the official exam page before booking.

## Hands-On Lab

### Lab Title

Operate and secure a service mesh with Istio

### Objective

Configure routing, mTLS, and authz policies, then troubleshoot behavior.

### Core Tasks

1. Build the baseline environment and document assumptions in `lab-starter/README.md`.
2. Implement the technical controls or workloads in `lab-starter/manifests/` and `lab-starter/scripts/`.
3. Validate end-to-end behavior, including one failure scenario and recovery.
4. Capture commands, outputs, and lessons learned in `lab-starter/notes/`.

### Portfolio Deliverables

- `lab-starter/manifests/istio-mesh/`
- `lab-starter/notes/traffic-shaping.md`
- `lab-starter/notes/commands.md`
- `lab-starter/notes/results.md`
- `lab-starter/notes/what-i-broke-and-fixed.md`

## Study Sprints

- Sprint 1: Learn domains, tools, and command surface.
- Sprint 2: Build the lab from scratch and capture repeatable steps.
- Sprint 3: Run timed practice and close weak areas.

## Hiring Signal

A reviewer should see that you can plan, implement, troubleshoot, and explain ICA-level work.

Use both success and fault-injection scenarios in your evidence.
