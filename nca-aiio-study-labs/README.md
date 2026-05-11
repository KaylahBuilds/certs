# NVIDIA NCA-AIIO Sprint Study Repo

Exam focus: NVIDIA-Certified Associate AI Infrastructure and Operations (`NCA-AIIO`)

This is a focused, hands-on sprint repo for the NVIDIA associate certification that covers AI infrastructure and operations.

## Note on exam name

You asked for "NVIDIA AI operations associate."
The current associate exam name is **AI Infrastructure and Operations (NCA-AIIO)**.

## What is inside

- `docs/study-plan-may11-may23-2026.md`: Day-by-day plan for a condensed sprint window
- `docs/resource-map.md`: Official blueprint + references
- `docs/official-repo-setup.md`: Companion NVIDIA repos to clone
- `diagrams/nca-aiio-architecture-diagrams.md`: Core architectures to memorize and explain
- `infographics/nca-aiio-infographics.md`: Final-week visual cheat sheets
- `labs/`: Ops-centric hands-on labs
- `manifests/`: Kubernetes and telemetry config examples
- `scripts/`: Runnable scripts for telemetry, capacity, and incident scoring
- `quizzes/nca-aiio-mini-quiz.md`: Timed self-check questions

## Official blueprint weighting

- Essential AI Knowledge: 38%
- AI Infrastructure: 40%
- AI Operations: 22%

## Exam format (official page)

- 50 questions
- 60 minutes
- Remote proctored

## Quick start

```bash
cd nca-aiio-study-labs
python3 -m venv .venv
source .venv/bin/activate
```

Run labs/scripts:

```bash
python scripts/telemetry_alerts.py \
  --input labs/lab-02-telemetry-monitoring/data/gpu_metrics_sample.csv

python scripts/capacity_planner.py \
  --inventory labs/lab-03-capacity-planning/data/cluster_inventory.json \
  --workloads labs/lab-03-capacity-planning/data/workload_requests.json

python scripts/runbook_score.py \
  --scenario labs/lab-04-incident-response/scenario.json \
  --response labs/lab-04-incident-response/response_template.json
```

## Companion repos

- GPU Operator: <https://github.com/NVIDIA/gpu-operator>
- k8s device plugin: <https://github.com/NVIDIA/k8s-device-plugin>
- DCGM: <https://github.com/NVIDIA/DCGM>
- DCGM Exporter: <https://github.com/NVIDIA/dcgm-exporter>

Tip: Use this repo for exam-speed fundamentals; use companion repos for deeper implementation details.
