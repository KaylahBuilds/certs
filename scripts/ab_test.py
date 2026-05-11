from __future__ import annotations

import argparse
import json
from pathlib import Path


def weighted_score(metrics: dict, weights: dict) -> float:
    score = 0.0
    for key, weight in weights.items():
        value = float(metrics.get(key, 0.0))
        score += value * float(weight)
    return score


def main() -> None:
    parser = argparse.ArgumentParser(description="Compute weighted A/B scores for experiment runs.")
    parser.add_argument("--runs", type=Path, required=True, help="Path to sample_runs.json")
    args = parser.parse_args()

    payload = json.loads(args.runs.read_text(encoding="utf-8"))
    weights = payload["weights"]
    runs = payload["runs"]

    ranked = []
    for run in runs:
        score = weighted_score(run["metrics"], weights)
        ranked.append((run["name"], score, run["metrics"]))

    ranked.sort(key=lambda item: item[1], reverse=True)

    print("Weights:")
    for k, v in weights.items():
        print(f"  {k}: {v}")

    print("\nRun scores:")
    for name, score, metrics in ranked:
        print(f"- {name}: {score:.4f} | metrics={metrics}")

    winner = ranked[0]
    print("\nWinner:")
    print(f"{winner[0]} with weighted score {winner[1]:.4f}")


if __name__ == "__main__":
    main()
