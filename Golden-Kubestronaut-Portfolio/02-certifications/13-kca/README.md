# KCA - Kyverno Certified Associate

## Study Plan Snapshot

- Phase: Phase 3
- Prep Window: Days 74-78 (Exam Day 79)
- Exam Type: Multiple-choice

## Architecture Diagram

```mermaid
flowchart LR
    U[Portfolio Repo] --> A[Admission Control]
    A --> B[Kyverno Policies]
    B --> C[Policy Reports]
    C --> D[Enforcement and Exceptions]
    D --> E[Evidence and Validation]
```

## Infographic - Focus Breakdown

| Domain | Weight / Priority |
|---|---|
| Fundamentals of Kyverno | 18% |
| Installation Configuration and Upgrades | 18% |
| Kyverno CLI | 12% |
| Applying Policies | 10% |
| Writing Policies | 32% |
| Policy Management | 10% |

> Note: Domain weights and competencies can change. Re-check the official exam page before booking.

## Hands-On Lab

### Lab Title

Codify policy-driven Kubernetes governance

### Objective

Create validate, mutate, generate, and verifyImage policies with test coverage.

### Core Tasks

1. Build the baseline environment and document assumptions in `lab-starter/README.md`.
2. Implement the technical controls or workloads in `lab-starter/manifests/` and `lab-starter/scripts/`.
3. Validate end-to-end behavior, including one failure scenario and recovery.
4. Capture commands, outputs, and lessons learned in `lab-starter/notes/`.

### Portfolio Deliverables

- `lab-starter/manifests/kyverno-policies/`
- `lab-starter/notes/policy-report.md`
- `lab-starter/notes/commands.md`
- `lab-starter/notes/results.md`
- `lab-starter/notes/what-i-broke-and-fixed.md`

## Study Sprints

- Sprint 1: Learn domains, tools, and command surface.
- Sprint 2: Build the lab from scratch and capture repeatable steps.
- Sprint 3: Run timed practice and close weak areas.

## Hiring Signal

A reviewer should see that you can plan, implement, troubleshoot, and explain KCA-level work.

Include policy exceptions and explain risk tradeoffs.
