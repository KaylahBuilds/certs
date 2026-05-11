# NCA-GENL Architecture Diagrams

## 1) Enterprise LLM App Reference Architecture

```mermaid
flowchart LR
    user[User] --> ui[Web App UI]
    ui --> api[Application API]
    api --> guard[Safety and Policy Layer]
    guard --> orch[Prompt Orchestrator]
    orch --> cache[Response Cache]
    orch --> llm[LLM Endpoint]
    orch --> retriever[Retriever Service]
    retriever --> vectordb[Vector Database]
    retriever --> docs[Source Documents]
    llm --> obs[Telemetry and Logging]
    retriever --> obs
    api --> obs
```

Study target:

- Explain where latency is introduced.
- Explain where safety controls should run.
- Explain how retrieval grounds model output.

## 2) RAG Ingestion and Query Flow

```mermaid
flowchart TB
    subgraph ingest[Ingestion Pipeline]
        raw[Raw Documents] --> parse[Parse and Normalize]
        parse --> chunk[Chunking]
        chunk --> embed[Embedding Model]
        embed --> index[Index Build]
        index --> store[Vector Store]
    end

    subgraph query[Query Pipeline]
        q[User Query] --> qembed[Query Embedding]
        qembed --> search[Similarity Search]
        search --> rerank[Rerank]
        rerank --> context[Top Context Chunks]
        context --> prompt[Prompt Assembly]
        prompt --> gen[LLM Generation]
        gen --> answer[Grounded Answer]
    end

    store --> search
```

Study target:

- Compare chunk-size tradeoffs.
- Explain top-k retrieval effects.
- Describe why reranking can improve answer quality.

## 3) Experimentation and Trustworthy AI Loop

```mermaid
flowchart LR
    design[Experiment Design] --> run[Run Prompt Variants]
    run --> eval[Score with Rubric and Metrics]
    eval --> review[Error Analysis]
    review --> safety[Safety and Alignment Review]
    safety --> update[Prompt and System Updates]
    update --> design
```

Study target:

- Define measurable success criteria.
- Separate quality failures from safety failures.
- Show how an iterative loop improves reliability.
