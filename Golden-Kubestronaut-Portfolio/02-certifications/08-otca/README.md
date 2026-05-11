# OTCA - OpenTelemetry Certified Associate

## Study Plan Snapshot

- Phase: Phase 3
- Prep Window: Days 55-58 (Exam Day 59)
- Exam Type: Multiple-choice

## Architecture Diagram

```mermaid
flowchart LR
    U[Portfolio Repo] --> A[Instrumented Service]
    A --> B[OpenTelemetry SDK]
    B --> C[OpenTelemetry Collector]
    C --> D[Observability Backend]
    D --> E[Evidence and Validation]
```

## Infographic - Focus Breakdown

| Domain | Weight / Priority |
|---|---|
| Fundamentals of Observability | 18% |
| OpenTelemetry API and SDK | 46% |
| OpenTelemetry Collector | 26% |
| Maintaining and Debugging Pipelines | 10% |
| Hands-On Validation | High |

> Note: Domain weights and competencies can change. Re-check the official exam page before booking.

## Hands-On Lab

### Lab Title

Create a trace metrics logs pipeline with OpenTelemetry

### Objective

Instrument a service and route telemetry through collector pipelines with validation.

### Core Tasks

1. Build the baseline environment and document assumptions in `lab-starter/README.md`.
2. Implement the technical controls or workloads in `lab-starter/manifests/` and `lab-starter/scripts/`.
3. Validate end-to-end behavior, including one failure scenario and recovery.
4. Capture commands, outputs, and lessons learned in `lab-starter/notes/`.

### Portfolio Deliverables

- `lab-starter/manifests/otel-pipeline/`
- `lab-starter/notes/context-propagation.md`
- `lab-starter/notes/commands.md`
- `lab-starter/notes/results.md`
- `lab-starter/notes/what-i-broke-and-fixed.md`

## Study Sprints

- Sprint 1: Learn domains, tools, and command surface.
- Sprint 2: Build the lab from scratch and capture repeatable steps.
- Sprint 3: Run timed practice and close weak areas.

## Hiring Signal

A reviewer should see that you can plan, implement, troubleshoot, and explain OTCA-level work.

Capture trace correlation across at least two services.
