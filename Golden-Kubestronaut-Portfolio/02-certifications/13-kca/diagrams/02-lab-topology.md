# KCA Lab Topology Diagram

~~~mermaid
flowchart TB
    U[Engineer Workstation] --> G[Git Repository]
    U --> K[Lab Environment]
    K --> O[Operational Controls]
    O --> V[Validation Outputs]
    V --> N[Notes and Retrospectives]
    N --> G
~~~

## Topology Notes

- Keep environments disposable and reproducible.
- Prefer declarative configuration for auditability.
- Treat notes as first-class engineering artifacts.
