# NCA-GENL Study Plan (May 11 to May 23, 2026)

This plan assumes:

- Weekdays: 2 to 2.5 focused hours
- Weekends: 4 to 5 focused hours
- One short daily review block (20 minutes) for spaced repetition

## Timeline overview

| Date | Focus | Output |
|---|---|---|
| May 11 | Baseline + Core ML foundations | Personal baseline and weak-topic list |
| May 12 | Core ML + LLM fundamentals | 1-page summary on transformer mechanics |
| May 13 | Software development for LLM apps | Working prompt templates and utility code |
| May 14 | Prompt engineering + alignment | Prompt iteration log with rubric scores |
| May 15 | Data analysis + feature/preprocessing | Retrieval dataset cleaned and chunked |
| May 16 | Experimentation + evaluation design | A/B test sheet + metrics definitions |
| May 17 | RAG architecture and retrieval tuning | Mini-RAG running from local text docs |
| May 18 | Integration and deployment concepts | Local API service for retrieval/chat |
| May 19 | Trustworthy AI + safety controls | Safety checklist + failure mode notes |
| May 20 | Mixed-domain review (high-weight first) | First 60-minute mock test |
| May 21 | Deep weak-area repair | Second timed mock + corrected notes |
| May 22 | Light review + exam readiness | Final cheat sheet + logistics checklist |
| May 23 | Exam day | Calm execution |

## Day-by-day plan

### May 11

- Read the official NCA-GENL page and blueprint.
- Start `labs/lab-01-prompt-engineering`.
- Create your weak-topic tracker with 3 levels: strong, medium, weak.

### May 12

- Review neural network and transformer basics.
- Cover tokens, embeddings, attention, context window, and inference concepts.
- Write 10 flashcards from your weak areas.

### May 13

- Practice Python workflow patterns used in LLM apps.
- Focus on input validation, modular prompt builders, and response parsing.
- Read `docs/resource-map.md` software-dev links.

### May 14

- Complete prompt engineering lab loop: baseline prompt -> constrained prompt -> role prompt -> chain prompt.
- Score responses with `scripts/score_prompt_cases.py`.
- Add alignment and safety constraints to each final prompt.

### May 15

- Build a simple retrieval dataset from short docs.
- Understand chunking strategy and query-document matching tradeoffs.
- Run `scripts/rag_mini.py` and test at least 8 queries.

### May 16

- Define experiment goals and measurable metrics.
- Run `scripts/ab_test.py` on sample runs and interpret results.
- Practice explaining precision/recall tradeoffs in plain language.

### May 17

- Draw and explain a full RAG pipeline from ingestion to answer.
- Tune top-k retrieval and compare results quality.
- Document two failure cases and mitigation ideas.

### May 18

- Launch the FastAPI lab app in `labs/lab-04-deployment`.
- Test retrieval endpoint behavior with easy and hard queries.
- Review deployment concerns: latency, reliability, and observability.

### May 19

- Study trustworthy AI controls: safety, privacy, prompt injection awareness.
- Add a safety policy section to your prompt templates.
- Write your "if unsafe, then" handling policy.

### May 20

- Take a 60-minute mock under exam constraints.
- Score it and classify misses by topic category.
- Re-study only categories with repeated misses.

### May 21

- Take second mock test (timed).
- Focus on high-weight categories first (30/24/22 areas).
- Review architecture diagrams from `diagrams/` from memory.

### May 22

- Light review only. No brand-new topics.
- Read `infographics/nca-genl-infographics.md` twice.
- Confirm exam setup: quiet room, secure browser readiness, internet stability.

### May 23 (Exam Day)

- 20-minute warm-up with flashcards only.
- Do not attempt deep new learning.
- During exam: move fast, mark uncertain items, and return on second pass.

## Time allocation by blueprint weight

Use your total prep time roughly as:

- 30%: content breakdown and LLM integration/deployment patterns
- 24%: core ML and AI knowledge
- 22%: software development
- 14%: experimentation
- 10%: data analysis and visualization

Trustworthy AI appears across multiple sections and should be practiced daily in prompts and architecture decisions.
