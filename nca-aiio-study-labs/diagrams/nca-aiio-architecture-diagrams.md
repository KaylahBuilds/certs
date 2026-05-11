# NCA-AIIO Architecture Diagrams

## 1) AI Infrastructure Stack (Physical to Workload)

```mermaid
flowchart LR
    apps["AI Applications"] --> platform["Orchestration and Scheduling"]
    platform --> runtime["Container Runtime and Tooling"]
    runtime --> drivers["NVIDIA Drivers and CUDA Stack"]
    drivers --> gpu["GPU Compute Resources"]
    gpu --> interconnect["High-Speed Interconnect"]
    interconnect --> storage["High-Throughput Storage"]
    storage --> facility["Power and Cooling Facilities"]
```

Study target:

- Explain each layer and one failure mode at that layer.
- Explain why operations teams need visibility across all layers.

## 2) Cluster Operations and Observability Flow

```mermaid
flowchart TB
    workload["AI Workload Jobs"] --> scheduler["Cluster Scheduler"]
    scheduler --> nodes["GPU Worker Nodes"]
    nodes --> exporter["DCGM Exporter"]
    exporter --> metrics["Metrics Store"]
    metrics --> alerts["Alerting Engine"]
    alerts --> oncall["On-Call Runbook"]
    oncall --> actions["Mitigation Actions"]
    actions --> scheduler
```

Study target:

- Describe how telemetry becomes actionable operations.
- Describe what alerts should trigger immediate escalation.

## 3) Training vs Inference Infrastructure Pattern

```mermaid
flowchart LR
    subgraph training["Training Path"]
        tdata["Large Datasets"] --> tcluster["Scaled Multi-GPU Cluster"]
        tcluster --> tstore["Checkpoint and Artifact Storage"]
    end

    subgraph inference["Inference Path"]
        request["Online Requests"] --> iservice["Model Serving Layer"]
        iservice --> igpu["Low-Latency GPU Inference"]
        igpu --> cache["Response and Feature Cache"]
    end

    tstore --> iservice
```

Study target:

- Compare throughput priorities for training vs latency priorities for inference.
- Identify where capacity planning differs between the two.

## 4) Incident Response Lifecycle for AI Ops

```mermaid
flowchart LR
    detect["Detect Anomaly"] --> triage["Triage Severity"]
    triage --> isolate["Isolate Impacted Components"]
    isolate --> mitigate["Mitigate and Restore Service"]
    mitigate --> verify["Verify Metrics Recovery"]
    verify --> postmortem["Postmortem and Prevention"]
    postmortem --> detect
```

Study target:

- Know the order and purpose of each phase.
- Distinguish operational mitigation from root-cause prevention.
