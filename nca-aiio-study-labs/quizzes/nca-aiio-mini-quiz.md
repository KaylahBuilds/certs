# NCA-AIIO Mini Quiz (15 Questions)

## Essential AI Knowledge

1. What is the key architectural difference between GPU and CPU compute models?
2. Why do training and inference commonly require different infrastructure priorities?
3. Name two factors that accelerated AI adoption in modern enterprises.
4. What role does the NVIDIA software stack play in production AI systems?
5. Why is workload-to-industry mapping useful for infrastructure planning?

## AI Infrastructure

6. List three hardware considerations for planning AI training clusters.
7. What are two advantages and two constraints of on-prem AI infrastructure?
8. Why are power and cooling first-class constraints in dense GPU environments?
9. What is the purpose of DPUs in modern data centers?
10. Which network characteristics matter most for distributed training workloads?

## AI Operations

11. What telemetry signals are most useful for detecting GPU instability?
12. Why should alerting systems distinguish warning vs critical severity?
13. What is the relationship between orchestration and job scheduling in AI ops?
14. What are key considerations when virtualizing accelerated infrastructure?
15. Why is postmortem discipline important after incident mitigation?

## Answer key (brief)

1. GPUs optimize massively parallel throughput; CPUs optimize low-latency general tasks.
2. Training favors throughput/scale; inference favors latency/availability.
3. Better compute, improved frameworks, stronger data pipelines, ecosystem maturity.
4. It integrates drivers, runtimes, toolkits, orchestration, and monitoring capabilities.
5. It aligns architecture decisions with workload behavior and SLOs.
6. GPU count/type, memory bandwidth, storage throughput, interconnect performance.
7. Advantage: control/security; constraint: capex/procurement/ops overhead.
8. Thermal and power limits directly affect reliability and sustained performance.
9. DPUs offload networking/storage/security tasks to improve system efficiency.
10. High bandwidth, low latency, stable fabric behavior, and fault tolerance.
11. Utilization, memory, temp, power, error events, interconnect health.
12. It reduces noise and ensures fastest response to business-impacting failures.
13. Orchestration coordinates platform resources; scheduling assigns workloads.
14. Isolation, performance overhead, device access, and operational complexity.
15. It captures root cause and prevents recurrence through system improvements.
