from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import List

from fastapi import FastAPI
from pydantic import BaseModel, Field
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity


@dataclass
class Chunk:
    source: str
    text: str


class QueryRequest(BaseModel):
    query: str = Field(..., min_length=3)
    top_k: int = Field(default=3, ge=1, le=10)


class RAGService:
    def __init__(self, data_dir: Path) -> None:
        self.chunks: List[Chunk] = []
        self.vectorizer = TfidfVectorizer(stop_words="english")
        self.matrix = None
        self._load_data(data_dir)

    def _load_data(self, data_dir: Path) -> None:
        if not data_dir.exists():
            raise FileNotFoundError(f"Data directory not found: {data_dir}")

        for path in sorted(data_dir.glob("*.txt")):
            raw = path.read_text(encoding="utf-8").strip()
            for block in [b.strip() for b in raw.split("\n\n") if b.strip()]:
                self.chunks.append(Chunk(source=path.name, text=block))

        if not self.chunks:
            raise ValueError("No text chunks found for retrieval.")

        self.matrix = self.vectorizer.fit_transform([c.text for c in self.chunks])

    def retrieve(self, query: str, top_k: int) -> List[dict]:
        q_vec = self.vectorizer.transform([query])
        sims = cosine_similarity(q_vec, self.matrix)[0]
        top_indices = sims.argsort()[::-1][:top_k]

        results = []
        for idx in top_indices:
            chunk = self.chunks[idx]
            results.append(
                {
                    "score": round(float(sims[idx]), 4),
                    "source": chunk.source,
                    "text": chunk.text,
                }
            )
        return results

    def answer(self, query: str, top_k: int) -> dict:
        matches = self.retrieve(query=query, top_k=top_k)
        context = " ".join(m["text"] for m in matches)
        sentences = [s.strip() for s in context.split(".") if s.strip()]
        answer = ". ".join(sentences[:2])
        if answer:
            answer = f"{answer}."
        else:
            answer = "No grounded context found."

        return {
            "query": query,
            "answer": answer,
            "evidence": matches,
            "note": "This is a study demo answer, not production generation.",
        }


app = FastAPI(title="NCA-GENL Mini Retrieval API", version="1.0.0")

_data_dir = Path(__file__).resolve().parents[1] / "lab-02-rag-mini" / "data"
_service = RAGService(data_dir=_data_dir)


@app.get("/health")
def health() -> dict:
    return {"status": "ok", "chunks_loaded": len(_service.chunks)}


@app.post("/retrieve")
def retrieve(req: QueryRequest) -> dict:
    return {"query": req.query, "results": _service.retrieve(req.query, req.top_k)}


@app.post("/answer")
def answer(req: QueryRequest) -> dict:
    return _service.answer(req.query, req.top_k)
