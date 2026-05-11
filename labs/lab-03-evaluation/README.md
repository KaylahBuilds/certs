# Lab 03: Experimentation and A/B Evaluation

## Goal

Evaluate prompt or pipeline variants with explicit metrics and a repeatable scoring method.

## What you practice

- Experiment design
- Weighted metric scoring
- Interpreting outcome quality vs safety

## Run

```bash
python ../../scripts/ab_test.py --runs sample_runs.json
```

## How it works

Each run has metric scores between 0 and 1:

- relevance
- groundedness
- safety
- latency

The script computes weighted totals and ranks candidates.

## Success criteria

- You can justify why the top candidate wins.
- You can identify one case where high relevance still fails safety.
- You can propose a next experiment with one clear hypothesis.
