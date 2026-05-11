from __future__ import annotations

import argparse
import json
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser(description="Score incident response runbook completeness and ordering.")
    parser.add_argument("--scenario", type=Path, required=True)
    parser.add_argument("--response", type=Path, required=True)
    args = parser.parse_args()

    scenario = json.loads(args.scenario.read_text(encoding="utf-8"))
    response = json.loads(args.response.read_text(encoding="utf-8"))

    required_steps = scenario["required_steps"]
    submitted_steps = response["steps"]

    submitted_lower = [step.strip().lower() for step in submitted_steps]
    required_lower = [step.strip().lower() for step in required_steps]

    covered = [step for step in required_lower if step in submitted_lower]
    missing = [step for step in required_lower if step not in submitted_lower]

    coverage_score = (len(covered) / len(required_lower)) * 100 if required_lower else 0.0

    order_hits = 0
    for i, step in enumerate(required_lower):
        if i < len(submitted_lower) and submitted_lower[i] == step:
            order_hits += 1

    order_score = (order_hits / len(required_lower)) * 100 if required_lower else 0.0
    overall = (coverage_score * 0.7) + (order_score * 0.3)

    print("Incident runbook score")
    print("----------------------")
    print(f"Scenario: {scenario['title']} ({scenario['severity']})")
    print(f"Coverage score: {coverage_score:.1f}")
    print(f"Ordering score: {order_score:.1f}")
    print(f"Overall score: {overall:.1f}")

    if missing:
        print("\nMissing required steps:")
        for step in missing:
            print(f"- {step}")

    if overall >= 85:
        print("\nResult: PASS (exam-ready runbook quality)")
    else:
        print("\nResult: NEEDS IMPROVEMENT")


if __name__ == "__main__":
    main()
