# NVIDIA NCA-GENL Sprint Study Repo

Exam target: May 23, 2026

This repo is a focused sprint plan for the NVIDIA Certified Associate Generative AI LLMs (NCA-GENL) exam.
It is organized for a 12-day prep window plus exam day.

## What is inside

- `docs/study-plan-may11-may23-2026.md`: Day-by-day study schedule
- `docs/resource-map.md`: Official topic-to-resource mapping
- `docs/official-repo-setup.md`: Clone and use official NVIDIA companion repos
- `diagrams/nca-genl-architecture-diagrams.md`: Architecture diagrams you should understand
- `infographics/nca-genl-infographics.md`: Quick memory infographics for final review
- `labs/`: Hands-on labs aligned to blueprint topics
- `scripts/`: Runnable Python scripts for retrieval, evaluation, and prompt scoring
- `quizzes/nca-genl-mini-quiz.md`: Practice questions

## Exam blueprint focus (from NVIDIA page)

- Content Breakdown: 30%
- Core Machine Learning and AI Knowledge: 24%
- Software Development: 22%
- Experimentation: 14%
- Data Analysis and Visualization: 10%
- Trustworthy AI appears as a listed domain in preparation materials

## Quick start

1. Create and activate a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Run the labs in order:

```bash
python scripts/score_prompt_cases.py \
  --cases labs/lab-01-prompt-engineering/prompt_cases.json

python scripts/rag_mini.py \
  --data-dir labs/lab-02-rag-mini/data \
  --query "What does RAG improve?"

python scripts/ab_test.py \
  --runs labs/lab-03-evaluation/sample_runs.json
cd labs/lab-04-deployment
uvicorn app:app --reload
```

## Official and companion repos

- NVIDIA Generative AI Examples: <https://github.com/NVIDIA/GenerativeAIExamples>
- NVIDIA RAG Blueprint: <https://github.com/NVIDIA-AI-Blueprints/rag>

Tip: Use this local repo for structured study, then borrow advanced workflows from the NVIDIA repos.
