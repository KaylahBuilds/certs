#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/kaylahgore/Documents/Cert/CERTS/Golden-Kubestronaut-Portfolio/02-certifications"

while IFS='|' read -r order slug code name phase prep_window exam node1 node2 node3 node4 lab_title lab_goal evidence1 evidence2 d1 d2 d3 d4 d5 d6 d7 d8 note; do
  dir="$ROOT/${order}-${slug}"
  mkdir -p "$dir/lab-starter/manifests" "$dir/lab-starter/scripts" "$dir/lab-starter/notes"

  cat > "$dir/README.md" <<EOT
# ${code} - ${name}

## Study Plan Snapshot

- Phase: ${phase}
- Prep Window: 
- Exam Type: ${exam}

## Architecture Diagram

\`\`\`mermaid
flowchart LR
    U[Portfolio Repo] --> A[${node1}]
    A --> B[${node2}]
    B --> C[${node3}]
    C --> D[${node4}]
    D --> E[Evidence and Validation]
\`\`\`

## Infographic - Focus Breakdown

| Domain | Weight / Priority |
|---|---|
| ${d1%:*} | ${d1#*:} |
| ${d2%:*} | ${d2#*:} |
| ${d3%:*} | ${d3#*:} |
| ${d4%:*} | ${d4#*:} |
| ${d5%:*} | ${d5#*:} |
EOT

  if [[ -n "$d6" ]]; then
    printf '| %s | %s |\n' "${d6%:*}" "${d6#*:}" >> "$dir/README.md"
  fi
  if [[ -n "$d7" ]]; then
    printf '| %s | %s |\n' "${d7%:*}" "${d7#*:}" >> "$dir/README.md"
  fi
  if [[ -n "$d8" ]]; then
    printf '| %s | %s |\n' "${d8%:*}" "${d8#*:}" >> "$dir/README.md"
  fi

  cat >> "$dir/README.md" <<EOT

## Hands-On Lab

### Lab Title

${lab_title}

### Objective

${lab_goal}

### Core Tasks

1. Build the baseline environment and document assumptions in \`lab-starter/README.md\`.
2. Implement the technical controls or workloads in \`lab-starter/manifests/\` and \`lab-starter/scripts/\`.
3. Validate end-to-end behavior, including one failure scenario and recovery.
4. Capture commands, outputs, and lessons learned in \`lab-starter/notes/\`.

### Portfolio Deliverables

- \`${evidence1}\`
- \`${evidence2}\`
- \`lab-starter/notes/commands.md\`
- \`lab-starter/notes/results.md\`
- \`lab-starter/notes/what-i-broke-and-fixed.md\`

## Study Sprints

- Sprint 1: Learn domains, tools, and command surface.
- Sprint 2: Build the lab from scratch and capture repeatable steps.
- Sprint 3: Run timed practice and close weak areas.

## Hiring Signal

A reviewer should see that you can plan, implement, troubleshoot, and explain ${code}-level work.

${note}
EOT

  cat > "$dir/lab-starter/README.md" <<EOT
# ${code} Lab Starter

## Scenario

${lab_title}

## Goal

${lab_goal}

## Required Evidence

- Architecture notes and assumptions
- Build and deploy steps
- Validation commands and output
- Failure scenario and recovery notes

## Notes Files

- notes/commands.md
- notes/results.md
- notes/what-i-broke-and-fixed.md
EOT

  : > "$dir/lab-starter/manifests/.gitkeep"
  : > "$dir/lab-starter/scripts/.gitkeep"
  : > "$dir/lab-starter/notes/commands.md"
  : > "$dir/lab-starter/notes/results.md"
  : > "$dir/lab-starter/notes/what-i-broke-and-fixed.md"
done <<'DATA'
01|lfcs|LFCS|Linux Foundation Certified System Administrator|Phase 1|Days 1-12 (Exam Day 13)|Performance-based|Engineer Workstation|Linux Host|Critical Services|Recovery Runbook|Harden and recover a Linux worker node|Create a hardened Linux baseline, simulate service failure, and recover quickly with evidence.|lab-starter/scripts/hardening.sh|lab-starter/notes/recovery-test.md|Operations and Deployment:25%|Networking:25%|Storage:20%|Essential Commands:20%|Users and Groups:10%||||Use a local VM and repeat the lab at least twice from a clean snapshot.
02|kcna|KCNA|Kubernetes and Cloud Native Associate|Phase 1|Days 10-15 (Exam Day 16)|Multiple-choice|Developer Laptop|Kubernetes API|Workload Objects|Cloud Native Ecosystem|Deploy and explain a 3-tier Kubernetes app|Demonstrate core Kubernetes primitives and explain architecture decisions clearly.|lab-starter/manifests/3tier-app/|lab-starter/notes/kcna-concept-walkthrough.md|Kubernetes Fundamentals:44%|Container Orchestration:28%|Cloud Native Application Delivery:16%|Cloud Native Architecture:12%|Practice Exams:High||||Create one diagram and one plain-language architecture walkthrough aimed at non-experts.
03|kcsa|KCSA|Kubernetes and Cloud Native Security Associate|Phase 1|Days 14-20 (Exam Day 21)|Multiple-choice|Security Controls|Kubernetes Control Plane|Workload Security|Compliance Mapping|Secure a baseline cluster against common threats|Apply baseline controls across identity, policy, networking, and supply chain concepts.|lab-starter/manifests/security-baseline/|lab-starter/notes/threat-model.md|Overview of Cloud Native Security:14%|Cluster Component Security:22%|Kubernetes Security Fundamentals:22%|Kubernetes Threat Model:16%|Platform Security:16%|Compliance and Security Frameworks:10%|||Build a short threat model table and map each control to a mitigation.
04|cka|CKA|Certified Kubernetes Administrator|Phase 2|Days 22-32 (Exam Day 33)|Performance-based|Admin Terminal|Cluster Bootstrap|Core Workloads|Troubleshooting Drills|Provision and operate a production-style Kubernetes cluster|Install, configure, and operate core cluster services with repeatable procedures.|lab-starter/manifests/cluster-ops/|lab-starter/notes/incident-drill.md|Cluster Architecture Installation and Configuration:25%|Services and Networking:20%|Workloads and Scheduling:15%|Troubleshooting:30%|Storage:10%||||Run timed recovery drills for DNS, networking, and failing workloads.
05|ckad|CKAD|Certified Kubernetes Application Developer|Phase 2|Days 30-39 (Exam Day 40)|Performance-based|Application Code|Container Image|Kubernetes Workloads|Traffic Entry Points|Ship a cloud-native app with secure configuration|Build and deploy an app with probes, config, secrets, and deployment strategies.|lab-starter/manifests/app-delivery/|lab-starter/notes/release-strategy.md|Application Design and Build:20%|Application Deployment:20%|Application Observability and Maintenance:15%|Application Environment Configuration and Security:25%|Services and Networking:20%||||Include one blue-green or canary rollout with rollback proof.
06|cks|CKS|Certified Kubernetes Security Specialist|Phase 2|Days 38-50 (Exam Day 51)|Performance-based|Threat Model|Hardening Controls|Supply Chain|Runtime Detection|Secure the full Kubernetes software lifecycle|Harden cluster and workloads, secure supply chain, and detect runtime anomalies.|lab-starter/manifests/security-ops/|lab-starter/notes/runtime-detections.md|Cluster Setup:15%|Cluster Hardening:15%|System Hardening:10%|Minimize Microservice Vulnerabilities:20%|Supply Chain Security:20%|Monitoring Logging and Runtime Security:20%|||Focus on attack simulation plus detection and containment evidence.
07|pca|PCA|Prometheus Certified Associate|Phase 3|Days 52-55 (Exam Day 56)|Multiple-choice|Application Metrics|Prometheus Server|Alert Rules|Dashboards|Build monitoring and alerting for a sample platform|Instrument services, write PromQL, and implement actionable alerts.|lab-starter/manifests/prometheus-stack/|lab-starter/notes/promql-playbook.md|Observability Concepts:18%|Prometheus Fundamentals:20%|PromQL:28%|Instrumentation and Exporters:16%|Alerting and Dashboarding:18%||||Include SLO-style alerts and one incident investigation walkthrough.
08|otca|OTCA|OpenTelemetry Certified Associate|Phase 3|Days 55-58 (Exam Day 59)|Multiple-choice|Instrumented Service|OpenTelemetry SDK|OpenTelemetry Collector|Observability Backend|Create a trace metrics logs pipeline with OpenTelemetry|Instrument a service and route telemetry through collector pipelines with validation.|lab-starter/manifests/otel-pipeline/|lab-starter/notes/context-propagation.md|Fundamentals of Observability:18%|OpenTelemetry API and SDK:46%|OpenTelemetry Collector:26%|Maintaining and Debugging Pipelines:10%|Hands-On Validation:High||||Capture trace correlation across at least two services.
09|cca|CCA|Cilium Certified Associate|Phase 3|Days 59-62 (Exam Day 63)|Multiple-choice|Kubernetes Cluster|Cilium Datapath|Network Policies|Hubble Observability|Implement Cilium networking and policy enforcement|Deploy Cilium features for connectivity, security, and observability.|lab-starter/manifests/cilium-lab/|lab-starter/notes/policy-tests.md|Architecture:20%|Network Policy:18%|Service Mesh:16%|Network Observability:10%|Installation and Configuration:10%|Cluster Mesh:10%|eBPF:10%|BGP and External Networking:6%|Add one policy test matrix showing allowed and denied paths.
10|ica|ICA|Istio Certified Associate|Phase 3|Days 62-67 (Exam Day 68)|Multiple-choice|Mesh Control Plane|Service-to-Service Traffic|Security Policy|Traffic Analysis|Operate and secure a service mesh with Istio|Configure routing, mTLS, and authz policies, then troubleshoot behavior.|lab-starter/manifests/istio-mesh/|lab-starter/notes/traffic-shaping.md|Installation Upgrades and Configuration:20%|Traffic Management:35%|Securing Workloads:25%|Troubleshooting:20%|Hands-On Scenarios:High||||Use both success and fault-injection scenarios in your evidence.
11|cgoa|CGOA|Certified GitOps Associate|Phase 3|Days 66-70 (Exam Day 71)|Multiple-choice|Git Repository|Desired State Manifests|Reconciliation Engine|Cluster State|Build a pull-based GitOps delivery workflow|Implement GitOps patterns with reconciliation and rollback verification.|lab-starter/manifests/gitops-app/|lab-starter/notes/reconciliation-drills.md|GitOps Terminology:20%|GitOps Principles:30%|Related Practices:16%|GitOps Patterns:20%|Tooling:14%||||Show state drift and recovery with timestamps.
12|capa|CAPA|Certified Argo Project Associate|Phase 3|Days 70-74 (Exam Day 75)|Multiple-choice|Argo Workflows|Argo CD|Argo Rollouts|Argo Events|Demonstrate end-to-end Argo ecosystem capability|Use multiple Argo components in one cohesive delivery workflow.|lab-starter/manifests/argo-ecosystem/|lab-starter/notes/progressive-delivery.md|Argo Workflows:36%|Argo CD:34%|Argo Rollouts:18%|Argo Events:12%|Integration Story:High||||Make sure rollout promotion and rollback evidence is explicit.
13|kca|KCA|Kyverno Certified Associate|Phase 3|Days 74-78 (Exam Day 79)|Multiple-choice|Admission Control|Kyverno Policies|Policy Reports|Enforcement and Exceptions|Codify policy-driven Kubernetes governance|Create validate, mutate, generate, and verifyImage policies with test coverage.|lab-starter/manifests/kyverno-policies/|lab-starter/notes/policy-report.md|Fundamentals of Kyverno:18%|Installation Configuration and Upgrades:18%|Kyverno CLI:12%|Applying Policies:10%|Writing Policies:32%|Policy Management:10%|||Include policy exceptions and explain risk tradeoffs.
14|cba|CBA|Certified Backstage Associate|Phase 4|Days 79-82 (Exam Day 83)|Multiple-choice|Developer Portal|Software Catalog|Backstage Plugins|Team Workflows|Stand up and customize an internal developer portal|Deploy Backstage, register services, and customize plugins for developer self-service.|lab-starter/manifests/backstage-portal/|lab-starter/notes/catalog-governance.md|Backstage Development Workflow:24%|Backstage Infrastructure:22%|Backstage Catalog:22%|Customizing Backstage:32%|Platform Adoption Story:High||||Document how the portal improves onboarding time and discoverability.
15|cnpa|CNPA|Certified Cloud Native Platform Engineering Associate|Phase 4|Days 82-85 (Exam Day 86)|Multiple-choice|Platform APIs|Self-Service Workflows|Policy and Security|Platform Metrics|Design a foundational internal developer platform|Model platform capabilities, delivery workflows, security, and platform KPIs.|lab-starter/manifests/cnpa-platform/|lab-starter/notes/platform-kpis.md|Platform Engineering Core Fundamentals:36%|Observability Security and Conformance:20%|Continuous Delivery and Platform Engineering:16%|Platform APIs and Provisioning Infrastructure:12%|IDPs and Developer Experience:8%|Measuring your Platform:8%|||Capture DORA metrics baseline and expected improvement targets.
16|cnpe|CNPE|Certified Cloud Native Platform Engineer|Phase 4|Days 84-88 (Exam Day 89)|Performance-based|IDP Architecture|GitOps Delivery|Platform APIs|Operational Guardrails|Build and operate an enterprise-grade platform engineering stack|Deliver a secure self-service platform with GitOps, policy, and observability controls.|lab-starter/manifests/cnpe-platform/|lab-starter/notes/capstone-runbook.md|Platform Architecture and Infrastructure:15%|GitOps and Continuous Delivery:25%|Platform APIs and Self-Service Capabilities:25%|Observability and Operations:20%|Security and Policy Enforcement:15%||||Treat this as your public capstone and include a full operations runbook.
DATA
