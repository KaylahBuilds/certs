# NCA-GENL Mini Quiz (15 Questions)

## Core ML and AI

1. What problem does attention solve better than plain recurrent processing in long sequences?
2. Why are embeddings central to retrieval systems?
3. What is a common tradeoff when increasing context window length?

## Software Development

4. Why is output schema enforcement useful in LLM applications?
5. What is the difference between orchestration logic and model inference logic?
6. How can retries and timeouts improve production reliability?

## Experimentation

7. Why should you define metrics before running prompt tests?
8. Give one case where a model variant increases relevance but reduces safety.
9. What is the purpose of a holdout set in evaluation?

## Data Analysis and Visualization

10. Which metric better captures ranking quality for top retrieval results?
11. Why might average score hide failure modes?
12. What chart helps compare multiple metric dimensions across variants?

## Content Breakdown and Integration

13. In a RAG system, where can hallucinations still happen even with retrieval?
14. Which component is best suited for enforcing policy checks before final response?
15. Why is observability required for trustworthy deployment?

## Answer key (brief)

1. It models long-range token relationships directly.
2. They map semantic similarity into vector space for search.
3. Better context coverage but higher latency/cost and sometimes more noise.
4. It reduces ambiguity and parsing errors downstream.
5. Orchestration coordinates prompts/tools; inference generates outputs.
6. They prevent transient failures from becoming user-visible outages.
7. Prevents subjective judgments and enables repeatability.
8. Example: longer context prompt helps detail but introduces unsafe unfiltered text.
9. To test generalization and avoid overfitting prompt tweaks.
10. A ranking metric such as precision@k or nDCG.
11. High mean can hide catastrophic low-safety outliers.
12. Radar chart or grouped bars.
13. Retrieval misses, noisy chunks, weak prompt constraints, or generation drift.
14. A guardrail/policy layer before response delivery.
15. You need traceability for debugging, audits, and risk management.
