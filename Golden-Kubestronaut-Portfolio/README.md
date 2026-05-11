# Golden Kubestronaut Portfolio Study Vault

This repository is a portfolio-first study system for the **Golden Kubestronaut** path.

It is designed so every certification has:
- a focused study plan
- an architecture diagram
- an infographic-style exam snapshot
- a hands-on lab with concrete repo artifacts

As of **May 11, 2026**, Golden Kubestronaut requires all CNCF certifications plus LFCS.

## Certification Set (16 Total)

1. LFCS
2. KCNA
3. KCSA
4. CKA
5. CKAD
6. CKS
7. PCA
8. ICA
9. CCA
10. CAPA
11. CGOA
12. CBA
13. OTCA
14. KCA
15. CNPA
16. CNPE

## Suggested Sequence (90-Day Sprint)

- Phase 1 (Days 1-21): LFCS, KCNA, KCSA
- Phase 2 (Days 22-51): CKA, CKAD, CKS
- Phase 3 (Days 52-79): PCA, OTCA, CCA, ICA, CGOA, CAPA, KCA
- Phase 4 (Days 79-90): CBA, CNPA, CNPE

> This is an aggressive timeline. The plan intentionally overlaps prep windows so you can finish inside 90 days.

## Repo Layout

- `00-start-here/`: setup, execution rules, and operating cadence
- `01-roadmap/`: phase plan, timeline, and exam booking strategy
- `02-certifications/`: per-certification portfolio packs
- `03-shared-templates/`: reusable evidence templates for all labs

## Priority Deep Dives

The most detailed packs are:

- `03-kcsa/` (security baseline with threat model, controls, and validation scripts)
- `12-capa/` (full Argo ecosystem lab across CD, Rollouts, Workflows, and Events)
- `15-cnpa/` (platform engineering associate design + KPI scorecard lab)
- `16-cnpe/` (platform engineering capstone with API, tenancy, policy, and observability)

## How To Use This Repo

1. Start with `00-start-here/00-operating-system.md`.
2. Follow `01-roadmap/01-golden-timeline.md`.
3. Work one certification folder at a time in `02-certifications/`.
4. For each certification, complete all lab deliverables and commit them.
5. Use templates in `03-shared-templates/` to standardize evidence.

## Portfolio Evidence Standard

For every certification lab, commit all of the following:

- `README.md` explaining objective and architecture
- manifests/config/IaC/scripts used
- command transcript (`notes/commands.md`)
- validation output (`notes/results.md`)
- one retrospective (`notes/what-i-broke-and-fixed.md`)

This gives recruiters and hiring managers proof that you can execute, debug, and communicate.
