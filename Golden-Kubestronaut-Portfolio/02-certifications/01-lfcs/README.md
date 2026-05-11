# LFCS - Linux Foundation Certified System Administrator

## Study Plan Snapshot

- Phase: Phase 1
- Prep Window: Days 1-12 (Exam Day 13)
- Exam Type: Performance-based

## Architecture Diagram

```mermaid
flowchart LR
    U[Portfolio Repo] --> A[Engineer Workstation]
    A --> B[Linux Host]
    B --> C[Critical Services]
    C --> D[Recovery Runbook]
    D --> E[Evidence and Validation]
```

## Infographic - Focus Breakdown

| Domain | Weight / Priority |
|---|---|
| Operations and Deployment | 25% |
| Networking | 25% |
| Storage | 20% |
| Essential Commands | 20% |
| Users and Groups | 10% |

> Note: Domain weights and competencies can change. Re-check the official exam page before booking.

## Hands-On Lab

### Lab Title

Harden and recover a Linux worker node

### Objective

Create a hardened Linux baseline, simulate service failure, and recover quickly with evidence.

### Core Tasks

1. Build the baseline environment and document assumptions in `lab-starter/README.md`.
2. Implement the technical controls or workloads in `lab-starter/manifests/` and `lab-starter/scripts/`.
3. Validate end-to-end behavior, including one failure scenario and recovery.
4. Capture commands, outputs, and lessons learned in `lab-starter/notes/`.

### Portfolio Deliverables

- `lab-starter/scripts/hardening.sh`
- `lab-starter/notes/recovery-test.md`
- `lab-starter/notes/commands.md`
- `lab-starter/notes/results.md`
- `lab-starter/notes/what-i-broke-and-fixed.md`

## Study Sprints

- Sprint 1: Learn domains, tools, and command surface.
- Sprint 2: Build the lab from scratch and capture repeatable steps.
- Sprint 3: Run timed practice and close weak areas.

## Hiring Signal

A reviewer should see that you can plan, implement, troubleshoot, and explain LFCS-level work.

Use a local VM and repeat the lab at least twice from a clean snapshot.
