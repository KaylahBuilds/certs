# NCA-GENL Infographics

## 1) Blueprint Weight Snapshot

| Category | Weight | Priority |
|---|---:|---|
| Content Breakdown | 30% | Very High |
| Core ML and AI Knowledge | 24% | Very High |
| Software Development | 22% | Very High |
| Experimentation | 14% | High |
| Data Analysis and Visualization | 10% | Medium |
| Trustworthy AI | Cross-cutting | Daily practice |

## 2) 60-Minute Exam Tactics

| Time Block | Action |
|---|---|
| 0-15 min | First pass, answer obvious questions fast |
| 15-40 min | Work medium-difficulty questions |
| 40-52 min | Return to marked questions |
| 52-60 min | Final sanity check and submit |

## 3) Prompt Quality Pyramid

```text
Top:    Reliability under constraints
Middle: Clear context + constraints + output format
Base:   Task clarity + role + objective
```

Quick check before finalizing a prompt:

- Is the task explicit?
- Is the output format fixed?
- Are safety boundaries stated?
- Is context sufficient for grounded answers?

## 4) RAG Failure Diagnosis Grid

| Symptom | Likely Cause | Fix |
|---|---|---|
| Off-topic answer | Poor retrieval | Improve query rewrite, top-k, rerank |
| Hallucinated facts | Missing context grounding | Enforce citation/context in prompt |
| Correct topic, weak detail | Chunk too broad | Reduce chunk size and retest |
| Slow responses | Too many retrieval steps | Cache embeddings and trim context |

## 5) Trustworthy AI Quick Checklist

```text
Input safety:    sanitize, detect malicious intent
Data safety:     limit sensitive data exposure
Output safety:   block harmful or policy-violating content
Auditability:    log prompts, context, and model outputs
Resilience:      define fallback behavior on unsafe outputs
```
