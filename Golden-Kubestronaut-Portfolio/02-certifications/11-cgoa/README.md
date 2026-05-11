# CGOA - Certified GitOps Associate

## Study Plan Snapshot

- Phase: Phase 3
- Prep Window: Days 66-70 (Exam Day 71)
- Exam Type: Multiple-choice

## Architecture Diagram

```mermaid
flowchart LR
    U[Portfolio Repo] --> A[Git Repository]
    A --> B[Desired State Manifests]
    B --> C[Reconciliation Engine]
    C --> D[Cluster State]
    D --> E[Evidence and Validation]
```

## Infographic - Focus Breakdown

| Domain | Weight / Priority |
|---|---|
| GitOps Terminology | 20% |
| GitOps Principles | 30% |
| Related Practices | 16% |
| GitOps Patterns | 20% |
| Tooling | 14% |

> Note: Domain weights and competencies can change. Re-check the official exam page before booking.

## Hands-On Lab

### Lab Title

Build a pull-based GitOps delivery workflow

### Objective

Implement GitOps patterns with reconciliation and rollback verification.

### Core Tasks

1. Build the baseline environment and document assumptions in `lab-starter/README.md`.
2. Implement the technical controls or workloads in `lab-starter/manifests/` and `lab-starter/scripts/`.
3. Validate end-to-end behavior, including one failure scenario and recovery.
4. Capture commands, outputs, and lessons learned in `lab-starter/notes/`.

### Portfolio Deliverables

- `lab-starter/manifests/gitops-app/`
- `lab-starter/notes/reconciliation-drills.md`
- `lab-starter/notes/commands.md`
- `lab-starter/notes/results.md`
- `lab-starter/notes/what-i-broke-and-fixed.md`

## Study Sprints

- Sprint 1: Learn domains, tools, and command surface.
- Sprint 2: Build the lab from scratch and capture repeatable steps.
- Sprint 3: Run timed practice and close weak areas.

## Hiring Signal

A reviewer should see that you can plan, implement, troubleshoot, and explain CGOA-level work.

Show state drift and recovery with timestamps.
