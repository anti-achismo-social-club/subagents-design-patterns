# Agent Composition Patterns

This document describes how to effectively combine multiple agents to solve complex problems using established composition patterns.

## Core Composition Patterns

### Sequential Chain
Execute agents in a specific order where each agent builds on the previous output.

```
Agent A → Agent B → Agent C → Result
```

**Example**: Research Pipeline
```
rag-retriever → reasoning-engine → reflector → human-validator
```

**Use When**:
- Tasks have clear dependencies
- Each step requires previous step's output
- Linear workflow progression

### Parallel Fork
Execute multiple agents simultaneously on the same input, then combine results.

```
         → Agent A →
Input   → Agent B → Combiner → Result
         → Agent C →
```

**Example**: Multi-Perspective Analysis
```
         → reflector (quality) →
Input   → evaluator (metrics)  → multi-agent (synthesis)
         → safety-guardian (safety) →
```

**Use When**:
- Independent analysis perspectives needed
- Time constraints require parallel processing
- Multiple validation criteria

### Hierarchical Coordination
One agent orchestrates multiple specialized agents.

```
        Orchestrator
           ↙  ↓  ↘
     Agent A  Agent B  Agent C
```

**Example**: Development Team
```
        multi-agent
           ↙     ↘
     planner   prompt-chainer
        ↓         ↓
   prioritizer  exception-handler
```

**Use When**:
- Complex coordination required
- Dynamic task assignment needed
- Resource allocation decisions

### Feedback Loop
Agents work iteratively, with outputs feeding back for refinement.

```
Agent A → Agent B → Evaluation → (loop back if needed) → Result
```

**Example**: Iterative Improvement
```
prompt-chainer → reflector → evaluator → (repeat until satisfactory)
```

**Use When**:
- Quality requirements are high
- Iterative refinement beneficial
- Convergence criteria can be defined

## Advanced Composition Patterns

### Pipeline with Branching
Sequential processing with conditional branches based on intermediate results.

```
Agent A → Decision Point → Agent B1 (condition 1)
                       → Agent B2 (condition 2)
                       → Agent B3 (condition 3)
```

**Example**: Adaptive Processing
```
router → high complexity: planner → multi-agent
      → medium complexity: prompt-chainer → reflector
      → low complexity: tool-orchestrator
```

### Master-Worker Pattern
One agent distributes work to multiple worker agents and aggregates results.

```
Master Agent → Worker 1 (Task A)
            → Worker 2 (Task B) → Aggregation → Result
            → Worker 3 (Task C)
```

**Example**: Distributed Analysis
```
parallelizer → explorer (codebase section 1)
            → explorer (codebase section 2) → synthesis
            → explorer (codebase section 3)
```

### Observer Pattern
Monitor agents watch primary agents and trigger actions based on observations.

```
Primary Agent → Task Execution
     ↓
Observer Agent → Monitoring → Intervention (if needed)
```

**Example**: Production Monitoring
```
tool-orchestrator → Business Logic
     ↓
resource-optimizer → Performance Monitoring → optimization actions
safety-guardian → Safety Monitoring → safety interventions
```

## Pattern Selection Guide

### By Task Complexity

**Simple Tasks** (1-2 agents):
- Single agent with error handling: `primary-agent + exception-handler`
- Basic validation: `primary-agent + reflector`

**Medium Tasks** (3-5 agents):
- Sequential chain: `planner → prompt-chainer → reflector → evaluator`
- Parallel validation: `primary-agent + (safety-guardian || human-validator)`

**Complex Tasks** (6+ agents):
- Hierarchical coordination: `multi-agent orchestrating specialists`
- Pipeline with monitoring: `core-pipeline + (resource-optimizer + evaluator)`

### By Quality Requirements

**High Quality**:
```
planner → prompt-chainer → reflector → human-validator → evaluator
```

**High Reliability**:
```
(primary-flow) + safety-guardian + exception-handler + resource-optimizer
```

**High Performance**:
```
router → parallelizer → (multiple-specialists) → aggregator
```

### By Domain

**Software Development**:
```
planner → multi-agent → (prompt-chainer + exception-handler) → evaluator
```

**Research & Analysis**:
```
explorer → rag-retriever → reasoning-engine → reflector → human-validator
```

**System Operations**:
```
resource-optimizer + safety-guardian + exception-handler + evaluator (all monitoring)
```

**Creative Work**:
```
prompt-chainer → reflector → human-validator → learning-adapter
```

## Implementation Guidelines

### Coordination Strategies

1. **Message Passing**: Agents communicate through structured messages
2. **Shared State**: Agents access common data structures
3. **Event-Driven**: Agents respond to events from other agents
4. **Orchestrated**: Central coordinator manages agent interactions

### Error Handling in Compositions

1. **Fail Fast**: Stop entire chain on critical failures
2. **Graceful Degradation**: Continue with reduced functionality
3. **Retry with Backoff**: Attempt recovery before failing
4. **Alternative Paths**: Route to backup agents on failure

### Performance Optimization

1. **Parallel Execution**: Use parallelizer for independent tasks
2. **Resource Sharing**: Cache results between agents
3. **Load Balancing**: Distribute work based on agent capacity
4. **Circuit Breaking**: Disable failing agents temporarily

## Common Anti-Patterns to Avoid

### Over-Coordination
**Problem**: Too many agents for simple tasks
**Solution**: Start simple, add complexity only when needed

### Linear Thinking
**Problem**: Always using sequential chains
**Solution**: Consider parallel and hierarchical patterns

### Ignoring Failure Modes
**Problem**: Not planning for agent failures
**Solution**: Always include error handling and monitoring

### Static Composition
**Problem**: Fixed agent combinations regardless of context
**Solution**: Use dynamic composition based on task requirements

## Testing Composition Patterns

### Unit Testing
Test individual agents in isolation

### Integration Testing
Test agent interactions and data flow

### End-to-End Testing
Test complete workflows under realistic conditions

### Performance Testing
Measure composition efficiency and resource usage

### Failure Testing
Validate error handling and recovery mechanisms