# Lab 03: Capacity Planning and Workload Fit

## Goal

Estimate whether current cluster capacity can satisfy incoming AI workload demand.

## Run

```bash
python ../../scripts/capacity_planner.py \
  --inventory data/cluster_inventory.json \
  --workloads data/workload_requests.json
```

## What to practice

- Effective GPU capacity vs raw GPU count
- Priority-aware workload admission
- Shortage detection and mitigation suggestions

## Success criteria

- You can calculate utilization headroom.
- You can identify which requests cannot be admitted.
- You can propose one realistic remediation path.
