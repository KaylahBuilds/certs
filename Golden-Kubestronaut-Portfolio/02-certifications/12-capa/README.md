# CAPA - Certified Argo Project Associate

## Study Plan Snapshot

- Phase: Phase 3
- Prep Window: Days 70-74 (Exam Day 75)
- Exam Type: Multiple-choice

## Architecture Diagram

```mermaid
flowchart LR
    U[Portfolio Repo] --> A[Argo Workflows]
    A --> B[Argo CD]
    B --> C[Argo Rollouts]
    C --> D[Argo Events]
    D --> E[Evidence and Validation]
```

## Infographic - Focus Breakdown

| Domain | Weight / Priority |
|---|---|
| Argo Workflows | 36% |
| Argo CD | 34% |
| Argo Rollouts | 18% |
| Argo Events | 12% |
| Integration Story | High |

> Note: Domain weights and competencies can change. Re-check the official exam page before booking.

## Hands-On Lab

### Lab Title

Demonstrate end-to-end Argo ecosystem capability

### Objective

Use multiple Argo components in one cohesive delivery workflow.

### Core Tasks

1. Build the baseline environment and document assumptions in `lab-starter/README.md`.
2. Implement the technical controls or workloads in `lab-starter/manifests/` and `lab-starter/scripts/`.
3. Validate end-to-end behavior, including one failure scenario and recovery.
4. Capture commands, outputs, and lessons learned in `lab-starter/notes/`.

### Portfolio Deliverables

- `lab-starter/manifests/argo-ecosystem/`
- `lab-starter/notes/progressive-delivery.md`
- `lab-starter/notes/commands.md`
- `lab-starter/notes/results.md`
- `lab-starter/notes/what-i-broke-and-fixed.md`

## Study Sprints

- Sprint 1: Learn domains, tools, and command surface.
- Sprint 2: Build the lab from scratch and capture repeatable steps.
- Sprint 3: Run timed practice and close weak areas.

## Hiring Signal

A reviewer should see that you can plan, implement, troubleshoot, and explain CAPA-level work.

Make sure rollout promotion and rollback evidence is explicit.
