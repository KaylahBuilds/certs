# Lab 04: Lightweight Deployment Lab

## Goal

Deploy a small retrieval service and reason about production concerns.

## Run

```bash
cd ../lab-04-deployment
uvicorn app:app --reload
```

Then open:

- `GET http://127.0.0.1:8000/health`
- `POST http://127.0.0.1:8000/retrieve`
- `POST http://127.0.0.1:8000/answer`

Example request body:

```json
{
  "query": "How does RAG improve reliability?",
  "top_k": 3
}
```

## Study focus

- API surface for LLM applications
- Retrieval service boundaries
- Logging and observability points
- Safety checks before final response
