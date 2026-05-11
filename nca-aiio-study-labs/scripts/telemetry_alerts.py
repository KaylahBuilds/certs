from __future__ import annotations

import argparse
import csv
from collections import Counter, defaultdict
from pathlib import Path


def classify_row(row: dict, util_high: float, mem_high: float, temp_critical: float, power_critical: float) -> tuple[str, list[str]]:
    reasons = []

    util = float(row["utilization"])
    mem = float(row["memory_utilization"])
    temp = float(row["temp_c"])
    power = float(row["power_w"])
    errors = int(row["error_count"])

    if temp >= temp_critical:
        reasons.append("temp_critical")
    if power >= power_critical:
        reasons.append("power_critical")
    if util >= util_high and mem >= mem_high:
        reasons.append("sustained_high_load")
    if errors > 0:
        reasons.append("gpu_error_event")

    if "temp_critical" in reasons or "gpu_error_event" in reasons:
        severity = "critical"
    elif reasons:
        severity = "warning"
    else:
        severity = "ok"

    return severity, reasons


def main() -> None:
    parser = argparse.ArgumentParser(description="Classify GPU telemetry rows into alert severities.")
    parser.add_argument("--input", type=Path, required=True, help="CSV telemetry file")
    parser.add_argument("--util-high", type=float, default=95.0)
    parser.add_argument("--mem-high", type=float, default=95.0)
    parser.add_argument("--temp-critical", type=float, default=85.0)
    parser.add_argument("--power-critical", type=float, default=320.0)
    args = parser.parse_args()

    severity_counts = Counter()
    reason_counts = Counter()
    gpu_critical_counts = defaultdict(int)

    rows = list(csv.DictReader(args.input.read_text(encoding="utf-8").splitlines()))
    if not rows:
        raise SystemExit("No telemetry rows found.")

    for row in rows:
        severity, reasons = classify_row(
            row,
            util_high=args.util_high,
            mem_high=args.mem_high,
            temp_critical=args.temp_critical,
            power_critical=args.power_critical,
        )
        severity_counts[severity] += 1
        for reason in reasons:
            reason_counts[reason] += 1
        if severity == "critical":
            gpu_critical_counts[row["gpu_id"]] += 1

    print("Telemetry summary")
    print("-----------------")
    print(f"Rows analyzed: {len(rows)}")
    print(f"OK rows: {severity_counts['ok']}")
    print(f"Warning rows: {severity_counts['warning']}")
    print(f"Critical rows: {severity_counts['critical']}")

    if reason_counts:
        print("\nAlert reason frequency:")
        for reason, count in reason_counts.most_common():
            print(f"- {reason}: {count}")

    if gpu_critical_counts:
        print("\nCritical alerts by GPU:")
        for gpu_id, count in sorted(gpu_critical_counts.items(), key=lambda item: item[1], reverse=True):
            print(f"- {gpu_id}: {count}")


if __name__ == "__main__":
    main()
