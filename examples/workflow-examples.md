# Workflow Examples

This document provides practical examples of how to use the agentic design pattern agents in real-world scenarios.

## Simple Workflows

### Code Review and Optimization

**Scenario**: Review code, identify issues, and optimize performance.

**Agent Sequence**:
1. **explorer** - Analyze codebase to understand structure and identify areas of concern
2. **reflector** - Perform detailed code review with quality assessment
3. **exception-handler** - Identify potential error conditions and edge cases
4. **resource-optimizer** - Analyze performance bottlenecks and suggest optimizations
5. **evaluator** - Measure improvement and validate changes

```yaml
# Usage pattern
1. explorer: "Investigate this codebase and identify potential improvement areas"
2. reflector: "Review the code quality, architecture, and best practices compliance"
3. exception-handler: "Analyze error handling and identify potential failure points"
4. resource-optimizer: "Evaluate performance characteristics and suggest optimizations"
5. evaluator: "Measure the impact of proposed changes and validate improvements"
```

### Research and Documentation

**Scenario**: Research a complex topic and create comprehensive documentation.

**Agent Sequence**:
1. **planner** - Break down research into manageable tasks
2. **rag-retriever** - Gather information from multiple sources
3. **parallelizer** - Process multiple research streams simultaneously
4. **reflector** - Review and improve content quality
5. **human-validator** - Get expert review for accuracy

```yaml
# Usage pattern
1. planner: "Create a research plan for [topic] including key areas to investigate"
2. rag-retriever: "Find authoritative sources and current information on [topic]"
3. parallelizer: "Research multiple aspects simultaneously: [aspect1], [aspect2], [aspect3]"
4. reflector: "Review the research for completeness, accuracy, and clarity"
5. human-validator: "Present findings for expert validation and feedback"
```

## Complex Workflows

### Multi-Agent Development Team

**Scenario**: Coordinate multiple specialized agents to build a software feature.

**Participating Agents**:
- **multi-agent** (orchestrator)
- **planner** (project management)
- **prompt-chainer** (implementation)
- **exception-handler** (error management)
- **evaluator** (quality assurance)
- **prioritizer** (task management)

```yaml
# Orchestration flow
1. multi-agent: "Coordinate development of [feature] across specialized agents"
   - planner: "Break down feature into development tasks with dependencies"
   - prioritizer: "Rank tasks by importance, complexity, and dependencies"
   - prompt-chainer: "Implement core functionality with step-by-step development"
   - exception-handler: "Add robust error handling and edge case management"
   - evaluator: "Test functionality and validate quality standards"
```

### Intelligent System Monitoring

**Scenario**: Comprehensive system monitoring with adaptive responses.

**Agent Combination**:
- **resource-optimizer** (performance monitoring)
- **safety-guardian** (safety validation)
- **exception-handler** (error management)
- **goal-monitor** (objective tracking)
- **agent-communicator** (coordination)

```yaml
# Monitoring cycle
1. resource-optimizer: "Monitor system resources and performance metrics"
2. safety-guardian: "Validate all operations remain within safety bounds"
3. exception-handler: "Manage any errors or anomalies that arise"
4. goal-monitor: "Track progress toward system objectives and KPIs"
5. agent-communicator: "Coordinate responses across monitoring agents"
```

## Specialized Use Cases

### Creative Content Development

**Agents**: reflector, human-validator, learning-adapter

```yaml
1. Initial creation: "Generate creative content for [purpose]"
2. reflector: "Review content for creativity, quality, and effectiveness"
3. human-validator: "Get human feedback on creative elements and impact"
4. learning-adapter: "Incorporate feedback to improve future creative output"
```

### Scientific Analysis

**Agents**: reasoning-engine, rag-retriever, reflector, evaluator

```yaml
1. rag-retriever: "Gather current scientific literature on [topic]"
2. reasoning-engine: "Apply logical analysis to synthesize findings"
3. reflector: "Review analysis for logical consistency and completeness"
4. evaluator: "Assess confidence levels and identify areas needing more research"
```

### Production System Maintenance

**Agents**: resource-optimizer, safety-guardian, exception-handler, evaluator

```yaml
1. resource-optimizer: "Continuously monitor system performance and resource usage"
2. safety-guardian: "Ensure all operations maintain safety and compliance standards"
3. exception-handler: "Manage any system errors or unexpected conditions"
4. evaluator: "Report on system health and performance metrics"
```

## Best Practices

### Agent Selection Guidelines

1. **Start with Planning**: Use `planner` for complex, multi-step tasks
2. **Coordinate Multiple Agents**: Use `multi-agent` when you need several specialized capabilities
3. **Handle Errors Proactively**: Include `exception-handler` in any production workflow
4. **Validate Quality**: Use `reflector` for iterative improvement and `evaluator` for assessment
5. **Get Human Input**: Use `human-validator` for high-stakes decisions or creative tasks

### Common Patterns

**Information Gathering**:
```
explorer → rag-retriever → reflector → evaluator
```

**Task Execution**:
```
planner → prioritizer → prompt-chainer → exception-handler
```

**System Operations**:
```
resource-optimizer → safety-guardian → exception-handler → evaluator
```

**Quality Assurance**:
```
reflector → human-validator → learning-adapter
```

### Avoid Anti-Patterns

1. **Don't over-orchestrate**: Not every task needs multiple agents
2. **Don't ignore errors**: Always include error handling in production workflows
3. **Don't skip validation**: Use quality checks for important outputs
4. **Don't forget monitoring**: Include evaluation and monitoring for ongoing systems