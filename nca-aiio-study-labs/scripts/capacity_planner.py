from __future__ import annotations

import argparse
import json
from pathlib import Path


PRIORITY_ORDER = {"high": 0, "medium": 1, "low": 2}


def cluster_capacity(cluster: dict) -> tuple[float, float]:
    raw = float(cluster["nodes"]) * float(cluster["gpus_per_node"])
    effective = raw * float(cluster["usable_gpu_fraction"])
    free = effective - float(cluster["allocated_gpus"])
    return effective, max(free, 0.0)


def main() -> None:
    parser = argparse.ArgumentParser(description="Estimate AI cluster admission capacity for workload requests.")
    parser.add_argument("--inventory", type=Path, required=True)
    parser.add_argument("--workloads", type=Path, required=True)
    args = parser.parse_args()

    inventory = json.loads(args.inventory.read_text(encoding="utf-8"))
    workloads = json.loads(args.workloads.read_text(encoding="utf-8"))["requests"]

    clusters = inventory["clusters"]

    print("Cluster capacity")
    print("----------------")

    total_effective = 0.0
    total_free = 0.0

    for c in clusters:
        effective, free = cluster_capacity(c)
        total_effective += effective
        total_free += free
        print(
            f"- {c['name']}: effective={effective:.1f} GPUs, "
            f"allocated={c['allocated_gpus']}, free={free:.1f}"
        )

    print("\nAdmission simulation")
    print("--------------------")

    sorted_requests = sorted(workloads, key=lambda item: PRIORITY_ORDER.get(item["priority"], 99))
    remaining = total_free
    admitted = []
    deferred = []

    for req in sorted_requests:
        needed = float(req["gpus"])
        if remaining >= needed:
            admitted.append(req)
            remaining -= needed
        else:
            deferred.append(req)

    requested_total = sum(float(r["gpus"]) for r in sorted_requests)
    admitted_total = sum(float(r["gpus"]) for r in admitted)

    print(f"Total effective free GPUs: {total_free:.1f}")
    print(f"Total requested GPUs: {requested_total:.1f}")
    print(f"Total admitted GPUs: {admitted_total:.1f}")
    print(f"Remaining free GPUs after admission: {remaining:.1f}")

    print("\nAdmitted workloads:")
    if admitted:
        for req in admitted:
            print(f"- {req['name']} ({req['priority']}, {req['gpus']} GPUs)")
    else:
        print("- none")

    print("\nDeferred workloads:")
    if deferred:
        for req in deferred:
            print(f"- {req['name']} ({req['priority']}, {req['gpus']} GPUs)")
    else:
        print("- none")

    if deferred:
        shortage = sum(float(r["gpus"]) for r in deferred)
        print("\nMitigation ideas:")
        print(f"- Add at least {shortage:.1f} effective GPUs or reschedule lower-priority work.")
        print("- Apply tighter runtime limits or use MIG/time-slicing where appropriate.")


if __name__ == "__main__":
    main()
