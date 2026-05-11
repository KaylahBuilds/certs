# CNPE Capstone Architecture

```mermaid
flowchart LR
    Dev[Developer] --> Portal[IDP and Platform API]
    Portal --> Claim[ServiceClaim Resource]
    Claim --> GitOps[GitOps Controller]
    GitOps --> Cluster[Tenant Namespace]
    Cluster --> Policy[Policy Enforcement]
    Cluster --> Obs[Observability Pipeline]
    Obs --> Runbook[Ops Runbook and SLO Review]
```

## Readout

- Platform API is the front door for self-service.
- GitOps applies desired state and policy enforces boundaries.
- Observability closes the operations feedback loop.
