from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Dict, List


def score_response(response: str, required: List[str], banned: List[str]) -> Dict[str, int]:
    if not response.strip():
        return {
            "required_hits": 0,
            "required_total": len(required),
            "banned_hits": 0,
            "score": 0,
            "missing_response": 1,
        }

    text = response.lower()
    required_hits = sum(1 for term in required if term.lower() in text)
    banned_hits = sum(1 for term in banned if term.lower() in text)
    score = required_hits - banned_hits
    return {
        "required_hits": required_hits,
        "required_total": len(required),
        "banned_hits": banned_hits,
        "score": score,
        "missing_response": 0,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description="Score baseline vs improved prompt outputs.")
    parser.add_argument("--cases", type=Path, required=True, help="Path to prompt_cases.json")
    args = parser.parse_args()

    cases = json.loads(args.cases.read_text(encoding="utf-8"))

    baseline_total = 0
    improved_total = 0

    for case in cases:
        required = case.get("required_keywords", [])
        banned = case.get("banned_keywords", [])

        baseline_resp = case.get("baseline_response", "")
        improved_resp = case.get("improved_response", "")

        baseline = score_response(baseline_resp, required, banned)
        improved = score_response(improved_resp, required, banned)

        baseline_total += baseline["score"]
        improved_total += improved["score"]

        print(f"\n[{case['id']}] {case['task']}")
        print(
            "  Baseline: "
            f"score={baseline['score']} "
            f"required={baseline['required_hits']}/{baseline['required_total']} "
            f"banned_hits={baseline['banned_hits']}"
            f"{' missing_response=1' if baseline['missing_response'] else ''}"
        )
        print(
            "  Improved: "
            f"score={improved['score']} "
            f"required={improved['required_hits']}/{improved['required_total']} "
            f"banned_hits={improved['banned_hits']}"
            f"{' missing_response=1' if improved['missing_response'] else ''}"
        )

    print("\n=== Summary ===")
    print(f"Baseline total score: {baseline_total}")
    print(f"Improved total score: {improved_total}")
    delta = improved_total - baseline_total
    print(f"Delta (improved - baseline): {delta}")


if __name__ == "__main__":
    main()
