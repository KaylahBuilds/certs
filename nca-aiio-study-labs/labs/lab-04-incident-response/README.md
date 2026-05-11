# Lab 04: Incident Runbook Scoring

## Goal

Practice operational triage logic and validate runbook completeness.

## Run

```bash
python ../../scripts/runbook_score.py \
  --scenario scenario.json \
  --response response_template.json
```

## What to practice

- Correct incident response sequence
- Coverage of required mitigation and communication steps
- Fast but structured decision-making under pressure

## Success criteria

- Coverage score >= 85%
- Correct ordering for critical first-response actions
- Clear owner + rollback/validation steps
