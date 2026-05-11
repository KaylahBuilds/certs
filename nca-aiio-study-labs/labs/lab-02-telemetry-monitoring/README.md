# Lab 02: Telemetry and Alerting

## Goal

Convert raw GPU telemetry into operational alerts and prioritized response.

## Run

```bash
python ../../scripts/telemetry_alerts.py \
  --input data/gpu_metrics_sample.csv
```

## What to practice

- Threshold tuning (temp, power, utilization)
- Distinguishing warnings from critical incidents
- Mapping alert outputs to runbook actions

## Experiments

- Lower `--temp-critical` from 85 to 80 and compare noise.
- Raise `--util-high` from 95 to 98 and compare missed hotspots.

## Success criteria

- Alerts are explainable and not overly noisy.
- Critical events are few but meaningful.
- You can justify threshold choices.
