# CKS - Certified Kubernetes Security Specialist

## Study Plan Snapshot

- Phase: Phase 2
- Prep Window: Days 38-50 (Exam Day 51)
- Exam Type: Performance-based

## Architecture Diagram

```mermaid
flowchart LR
    U[Portfolio Repo] --> A[Threat Model]
    A --> B[Hardening Controls]
    B --> C[Supply Chain]
    C --> D[Runtime Detection]
    D --> E[Evidence and Validation]
```

## Infographic - Focus Breakdown

| Domain | Weight / Priority |
|---|---|
| Cluster Setup | 15% |
| Cluster Hardening | 15% |
| System Hardening | 10% |
| Minimize Microservice Vulnerabilities | 20% |
| Supply Chain Security | 20% |
| Monitoring Logging and Runtime Security | 20% |

> Note: Domain weights and competencies can change. Re-check the official exam page before booking.

## Hands-On Lab

### Lab Title

Secure the full Kubernetes software lifecycle

### Objective

Harden cluster and workloads, secure supply chain, and detect runtime anomalies.

### Core Tasks

1. Build the baseline environment and document assumptions in `lab-starter/README.md`.
2. Implement the technical controls or workloads in `lab-starter/manifests/` and `lab-starter/scripts/`.
3. Validate end-to-end behavior, including one failure scenario and recovery.
4. Capture commands, outputs, and lessons learned in `lab-starter/notes/`.

### Portfolio Deliverables

- `lab-starter/manifests/security-ops/`
- `lab-starter/notes/runtime-detections.md`
- `lab-starter/notes/commands.md`
- `lab-starter/notes/results.md`
- `lab-starter/notes/what-i-broke-and-fixed.md`

## Study Sprints

- Sprint 1: Learn domains, tools, and command surface.
- Sprint 2: Build the lab from scratch and capture repeatable steps.
- Sprint 3: Run timed practice and close weak areas.

## Hiring Signal

A reviewer should see that you can plan, implement, troubleshoot, and explain CKS-level work.

Focus on attack simulation plus detection and containment evidence.
