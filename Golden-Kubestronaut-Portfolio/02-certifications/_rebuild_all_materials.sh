#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/kaylahgore/Documents/Cert/CERTS/Golden-Kubestronaut-Portfolio/02-certifications"

for dir in "$ROOT"/[0-9][0-9]-*; do
  [[ -d "$dir" ]] || continue

  code=$(awk '/^# /{gsub("# ", "", $0); split($0,a," - "); print a[1]; exit}' "$dir/README.md")
  name=$(awk '/^# /{gsub("# ", "", $0); split($0,a," - "); print a[2]; exit}' "$dir/README.md")
  phase=$(awk '/^- Phase: /{sub("- Phase: ", "", $0); print; exit}' "$dir/README.md")
  window=$(awk '/^- Prep Window: /{sub("- Prep Window: ", "", $0); print; exit}' "$dir/README.md")

  case "$code" in
    LFCS)
      focus1="Linux boot, process, service, and recovery workflows"
      focus2="Networking, storage, and user administration"
      focus3="Hands-on troubleshooting under time pressure"
      tool1="systemd"
      tool2="journalctl"
      tool3="ss, ip, and nftables"
      proof="Recovery runbook and timed break/fix transcript"
      ;;
    KCNA)
      focus1="Kubernetes architecture and control plane basics"
      focus2="Containers, scheduling, and cloud native lifecycle"
      focus3="CNCF ecosystem and cloud native patterns"
      tool1="kubectl"
      tool2="container runtime CLI"
      tool3="Helm basics"
      proof="3-tier app manifests and architecture walkthrough"
      ;;
    KCSA)
      focus1="Threat models for control plane, workloads, and supply chain"
      focus2="Kubernetes identity, policy, and segmentation controls"
      focus3="Compliance mapping and security operations"
      tool1="kubectl auth can-i"
      tool2="NetworkPolicy"
      tool3="Pod Security Admission"
      proof="Security baseline lab with threat-model evidence"
      ;;
    CKA)
      focus1="Cluster administration and lifecycle management"
      focus2="Core networking, storage, and workload operations"
      focus3="Incident response and troubleshooting drills"
      tool1="kubectl"
      tool2="etcd backup and restore"
      tool3="kubeadm or managed-cluster equivalent"
      proof="Timed operations drill and incident timeline"
      ;;
    CKAD)
      focus1="Application deployment and release patterns"
      focus2="Configuration, secrets, probes, and runtime settings"
      focus3="Service exposure and operational observability"
      tool1="kubectl"
      tool2="Kustomize or Helm"
      tool3="Deployment rollout strategies"
      proof="Progressive rollout with rollback validation"
      ;;
    CKS)
      focus1="Cluster and node hardening controls"
      focus2="Supply chain safeguards and workload isolation"
      focus3="Runtime detection, logging, and response"
      tool1="NetworkPolicy"
      tool2="policy and admission controls"
      tool3="runtime detection tooling"
      proof="Security incident simulation and containment report"
      ;;
    PCA)
      focus1="Prometheus architecture and scrape model"
      focus2="PromQL query design and alert rules"
      focus3="SLO dashboards and incident workflows"
      tool1="Prometheus"
      tool2="Alertmanager"
      tool3="Grafana"
      proof="PromQL playbook with triggered alerts"
      ;;
    OTCA)
      focus1="OpenTelemetry signals and context propagation"
      focus2="Collector pipelines for traces, metrics, and logs"
      focus3="Telemetry debugging and reliability"
      tool1="OpenTelemetry SDK"
      tool2="OpenTelemetry Collector"
      tool3="trace and metrics backend"
      proof="End-to-end trace correlation across services"
      ;;
    CCA)
      focus1="Cilium datapath and eBPF networking model"
      focus2="Policy enforcement and traffic visibility"
      focus3="Multi-cluster and external connectivity"
      tool1="Cilium CLI"
      tool2="Hubble"
      tool3="Cilium policy resources"
      proof="Policy matrix with allow and deny evidence"
      ;;
    ICA)
      focus1="Istio installation and control plane operations"
      focus2="Traffic management and resilience patterns"
      focus3="mTLS and authorization policy design"
      tool1="istioctl"
      tool2="VirtualService and DestinationRule"
      tool3="AuthN and AuthZ policies"
      proof="Traffic shaping and fault-injection report"
      ;;
    CGOA)
      focus1="GitOps principles and pull-based reconciliation"
      focus2="Repository patterns and promotion flow"
      focus3="Operational safety and drift recovery"
      tool1="Argo CD or Flux"
      tool2="Git branch strategy"
      tool3="Kustomize overlays"
      proof="Drift detection and restoration timeline"
      ;;
    CAPA)
      focus1="Argo CD, Workflows, Rollouts, and Events integration"
      focus2="Progressive delivery and automated verification"
      focus3="GitOps operational workflows"
      tool1="Argo CD"
      tool2="Argo Rollouts"
      tool3="Argo Workflows"
      proof="Unified Argo ecosystem delivery lab"
      ;;
    KCA)
      focus1="Kyverno policy lifecycle and governance"
      focus2="Validate, mutate, generate, and verifyImage patterns"
      focus3="Policy reporting and exception management"
      tool1="Kyverno CLI"
      tool2="ClusterPolicy"
      tool3="PolicyReport"
      proof="Policy suite with pass/fail evidence"
      ;;
    CBA)
      focus1="Backstage architecture and integrations"
      focus2="Software catalog modeling and ownership"
      focus3="Plugin customization and developer workflows"
      tool1="Backstage catalog"
      tool2="TechDocs"
      tool3="Scaffolder"
      proof="Portal adoption and catalog governance notes"
      ;;
    CNPA)
      focus1="Platform engineering capabilities and operating model"
      focus2="Self-service workflows, APIs, and guardrails"
      focus3="Platform metrics with DORA and developer UX"
      tool1="GitOps controller"
      tool2="policy engine"
      tool3="developer portal"
      proof="Platform KPI baseline and target improvements"
      ;;
    CNPE)
      focus1="Platform implementation with secure self-service controls"
      focus2="GitOps delivery, tenancy boundaries, and API contracts"
      focus3="Operations, observability, and continuous improvement"
      tool1="IDP stack"
      tool2="Argo CD or Flux"
      tool3="Kyverno and OpenTelemetry"
      proof="End-to-end platform capstone runbook"
      ;;
    *)
      focus1="Core exam domains"
      focus2="Hands-on implementation"
      focus3="Troubleshooting and validation"
      tool1="kubectl"
      tool2="git"
      tool3="yaml tooling"
      proof="Complete lab evidence package"
      ;;
  esac

  mkdir -p "$dir/study-materials" "$dir/diagrams" "$dir/lab-starter/scripts"

  cat > "$dir/study-materials/01-domain-coverage.md" <<MAT
# ${code} Domain Coverage Plan

## Context

- Certification: ${code} (${name})
- Phase: ${phase}
- 90-day Window: ${window}

## High-Value Focus Areas

1. ${focus1}
2. ${focus2}
3. ${focus3}

## Daily Study Loop

1. 45 minutes: blueprint and notes review.
2. 45 minutes: command and concept drill.
3. 90 minutes: hands-on lab build and debugging.
4. 30 minutes: retrospective and evidence capture.

## Weekly Exit Criteria

- Explain architecture from memory.
- Rebuild the main lab from scratch.
- Pass one timed mini-mock at 80 percent or better.

## Tool Stack To Practice

- ${tool1}
- ${tool2}
- ${tool3}
MAT

  cat > "$dir/study-materials/02-daily-drills.md" <<MAT
# ${code} Daily Drills

## Drill Set

- Drill 1: Rebuild core scenario in a clean namespace or VM.
- Drill 2: Inject one failure and recover in less than 15 minutes.
- Drill 3: Explain control and data flow in plain language.
- Drill 4: Verify security and observability signals.

## Time-Boxed Exam Drill

- 10 minutes architecture sketch
- 20 minutes implementation sprint
- 10 minutes validation and notes

## Evidence To Commit

- Updated manifests, configs, or scripts.
- notes/commands.md with exact command sequence.
- notes/results.md with validation output.
- notes/what-i-broke-and-fixed.md with one failure story.
MAT

  cat > "$dir/study-materials/03-practice-questions.md" <<MAT
# ${code} Practice Question Prompts

1. Which architecture decisions matter most for ${code} and why?
2. Which misconfiguration creates the highest risk in this domain?
3. How do you validate success beyond resource status being Running?
4. Which signal would you inspect first during incident triage?
5. What is one secure-by-default baseline you would enforce?
6. What tradeoff did you make in the lab and why?
7. How would this design scale to multi-team usage?
8. Which failure mode is hardest to detect and how do you mitigate it?
9. Which artifact best demonstrates your ${code} skill?
10. What do you still need to improve before exam day?
MAT

  cat > "$dir/diagrams/01-study-architecture.md" <<MAT
# ${code} Study Architecture Diagram

~~~mermaid
flowchart LR
    A[Blueprint Study] --> B[Hands-on Lab Build]
    B --> C[Validation and Tests]
    C --> D[Failure Injection]
    D --> E[Recovery and Hardening]
    E --> F[Portfolio Evidence Commit]
    F --> G[Timed Exam Drill]
~~~

## Diagram Notes

- Theory always feeds immediate hands-on practice.
- Failure injection is mandatory, not optional.
- Evidence capture creates interview-ready proof.
MAT

  cat > "$dir/diagrams/02-lab-topology.md" <<MAT
# ${code} Lab Topology Diagram

~~~mermaid
flowchart TB
    U[Engineer Workstation] --> G[Git Repository]
    U --> K[Lab Environment]
    K --> O[Operational Controls]
    O --> V[Validation Outputs]
    V --> N[Notes and Retrospectives]
    N --> G
~~~

## Topology Notes

- Keep environments disposable and reproducible.
- Prefer declarative configuration for auditability.
- Treat notes as first-class engineering artifacts.
MAT

  cat > "$dir/lab-starter/notes/README.md" <<MAT
# Evidence Checklist

Complete all items before marking this lab complete:

- [ ] Commands captured in commands.md
- [ ] Validation results captured in results.md
- [ ] Failure and recovery write-up captured in what-i-broke-and-fixed.md
- [ ] Certification-specific proof captured: ${proof}
MAT

  if [[ ! -f "$dir/lab-starter/scripts/setup.sh" ]]; then
    cat > "$dir/lab-starter/scripts/setup.sh" <<MAT
#!/usr/bin/env bash
set -euo pipefail

echo "Prepare prerequisites for this lab and apply manifests."
MAT
    chmod +x "$dir/lab-starter/scripts/setup.sh"
  fi

  if [[ ! -f "$dir/lab-starter/scripts/validate.sh" ]]; then
    cat > "$dir/lab-starter/scripts/validate.sh" <<MAT
#!/usr/bin/env bash
set -euo pipefail

echo "Run certification-specific validations and record outputs in notes/results.md."
MAT
    chmod +x "$dir/lab-starter/scripts/validate.sh"
  fi

done
