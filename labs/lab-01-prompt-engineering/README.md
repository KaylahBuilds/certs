# Lab 01: Prompt Engineering and Alignment

## Goal

Build better prompts through structured iteration and apply basic alignment constraints.

## What you practice

- Prompt clarity and output formatting
- Safety and alignment instructions
- Measurable prompt evaluation

## Steps

1. Open `prompt_cases.json`.
2. For each case, run the `baseline_prompt` in your preferred LLM.
3. Save the response under `baseline_response`.
4. Improve the prompt and save it under `improved_prompt`.
5. Save the second response under `improved_response`.
6. Score both using:

```bash
python ../../scripts/score_prompt_cases.py --cases prompt_cases.json
```

## Success criteria

- Improved prompts score higher than baseline prompts.
- Improved outputs follow requested format.
- Safety constraints are respected.

## Reflection prompts

- Which prompt change gave the biggest quality gain?
- Which safety instruction changed model behavior most clearly?
- What would you standardize into a reusable prompt template?
