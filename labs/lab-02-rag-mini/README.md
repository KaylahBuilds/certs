# Lab 02: Mini RAG Pipeline

## Goal

Understand retrieval-augmented generation mechanics with a lightweight local implementation.

## What you practice

- Chunking and indexing text documents
- Query embedding and top-k retrieval
- Grounded answering from retrieved context

## Run

```bash
python ../../scripts/rag_mini.py \
  --data-dir data \
  --query "How does RAG improve reliability?" \
  --top-k 3
```

## Experiment ideas

- Compare `--top-k 2` vs `--top-k 5`.
- Edit document text and observe retrieval shifts.
- Add one noisy document and analyze degradation.

## Success criteria

- Retrieved chunks are relevant to query intent.
- Final answer references retrieved evidence.
- You can explain where hallucinations can still happen.
