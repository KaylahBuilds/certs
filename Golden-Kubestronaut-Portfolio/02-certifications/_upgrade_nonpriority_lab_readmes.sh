#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/kaylahgore/Documents/Cert/CERTS/Golden-Kubestronaut-Portfolio/02-certifications"

for dir in "$ROOT"/[0-9][0-9]-*; do
  base=$(basename "$dir")
  case "$base" in
    03-kcsa|12-capa|15-cnpa|16-cnpe) continue ;;
  esac

  code=$(awk '/^# /{gsub("# ", "", $0); split($0,a," - "); print a[1]; exit}' "$dir/README.md")
  scenario=$(awk 'BEGIN{s=0}/### Lab Title/{s=1;next} s==1 && NF{print; exit}' "$dir/README.md")
  goal=$(awk 'BEGIN{s=0}/### Objective/{s=1;next} s==1 && NF{print; exit}' "$dir/README.md")

  manifest_subdir=$(find "$dir/lab-starter/manifests" -mindepth 1 -maxdepth 1 -type d | head -n1 || true)
  if [[ -n "$manifest_subdir" ]]; then
    manifest_hint="${manifest_subdir##*/}"
  else
    manifest_hint="core-lab"
  fi

  cat > "$dir/lab-starter/README.md" <<EOT
# ${code} Lab Starter

## Scenario

${scenario}

## Goal

${goal}

## Build Plan

1. Document architecture assumptions in notes/commands.md.
2. Create manifests and configs in manifests/${manifest_hint}/.
3. Add helper automation in scripts/setup.sh and scripts/validate.sh.
4. Execute one failure scenario and one recovery scenario.

## Validation Checklist

- [ ] Workload or control plane objective achieved
- [ ] Security controls validated where applicable
- [ ] Observability or metrics checks recorded
- [ ] Failure and recovery evidence captured

## Required Evidence

- notes/commands.md
- notes/results.md
- notes/what-i-broke-and-fixed.md
- notes/README.md checklist completed
EOT
done
