from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
from typing import List

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity


@dataclass
class Chunk:
    source: str
    text: str


def load_chunks(data_dir: Path) -> List[Chunk]:
    chunks: List[Chunk] = []
    for path in sorted(data_dir.glob("*.txt")):
        raw = path.read_text(encoding="utf-8").strip()
        for block in [b.strip() for b in raw.split("\n\n") if b.strip()]:
            chunks.append(Chunk(source=path.name, text=block))
    return chunks


def answer_from_context(query: str, contexts: List[str]) -> str:
    # Simple extraction style answer for study purposes.
    query_terms = {t.lower() for t in query.split() if len(t) > 3}
    selected = []
    for text in contexts:
        for sentence in text.split("."):
            s = sentence.strip()
            if not s:
                continue
            lower = s.lower()
            if any(term in lower for term in query_terms):
                selected.append(s)

    if not selected:
        selected = [c.split(".")[0].strip() for c in contexts if c.strip()]

    answer = ". ".join(selected[:2]).strip()
    if answer and not answer.endswith("."):
        answer += "."
    return answer or "No answer generated from retrieved context."


def run_query(chunks: List[Chunk], vectorizer: TfidfVectorizer, matrix, query: str, top_k: int) -> None:
    q_vec = vectorizer.transform([query])
    sims = cosine_similarity(q_vec, matrix)[0]
    top_idx = sims.argsort()[::-1][:top_k]

    print(f"\nQuery: {query}")
    print("Top retrieved chunks:")

    selected_contexts: List[str] = []
    for rank, idx in enumerate(top_idx, start=1):
        chunk = chunks[idx]
        score = float(sims[idx])
        selected_contexts.append(chunk.text)
        print(f"{rank}. score={score:.4f} source={chunk.source}")
        print(f"   {chunk.text[:220]}{'...' if len(chunk.text) > 220 else ''}")

    draft_answer = answer_from_context(query, selected_contexts)
    print("\nDraft grounded answer:")
    print(draft_answer)


def main() -> None:
    parser = argparse.ArgumentParser(description="Mini RAG retrieval demo for NCA-GENL study.")
    parser.add_argument("--data-dir", type=Path, required=True, help="Directory with .txt docs")
    parser.add_argument("--query", type=str, default="", help="Single query to run")
    parser.add_argument("--top-k", type=int, default=3)
    args = parser.parse_args()

    chunks = load_chunks(args.data_dir)
    if not chunks:
        raise SystemExit("No chunks found. Add .txt files to the data directory.")

    vectorizer = TfidfVectorizer(stop_words="english")
    matrix = vectorizer.fit_transform([c.text for c in chunks])

    if args.query:
        run_query(chunks, vectorizer, matrix, args.query, args.top_k)
        return

    print("Interactive mode. Type 'exit' to quit.")
    while True:
        query = input("\nEnter query: ").strip()
        if query.lower() in {"exit", "quit"}:
            break
        if not query:
            continue
        run_query(chunks, vectorizer, matrix, query, args.top_k)


if __name__ == "__main__":
    main()
