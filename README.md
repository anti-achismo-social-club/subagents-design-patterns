# Agentic Design Patterns - Specialized Agents

A comprehensive collection of 21 specialized agents implementing the agentic design patterns from "Agentic Design Patterns" by Antonio Gulli. These agents provide systematic approaches to common AI agent challenges and can be used individually or in combination to solve complex problems.

## Overview

This repository contains implementations of all 21 core patterns from the book, organized into specialized agents that can be deployed in AI systems. Each agent follows the scientific principles and methodologies outlined in the original work, providing reliable and well-tested approaches to agent design.

**Source Material**: [Agentic Design Patterns](https://github.com/anti-achismo-social-club/agentic-design-patterns) by Antonio Gulli
**Architecture Inspiration**: [wshobson/agents](https://github.com/wshobson/agents) - Simple, flat structure focused on functionality

## Agent Categories

### Core Patterns (1-7)
Fundamental patterns for basic agent capabilities and workflow management.

- **[prompt-chainer](agents/prompt-chainer.md)** - Sequential prompt execution for complex multi-step tasks
- **[router](agents/router.md)** - Intelligent request classification and routing to appropriate handlers
- **[parallelizer](agents/parallelizer.md)** - Concurrent execution of multiple independent tasks
- **[reflector](agents/reflector.md)** - Self-examination and iterative improvement of outputs
- **[tool-orchestrator](agents/tool-orchestrator.md)** - Strategic external tool integration and management
- **[planner](agents/planner.md)** - Structured task decomposition with dependency management
- **[multi-agent](agents/multi-agent.md)** - Collaborative problem-solving through agent coordination

### Advanced Patterns (8-11)
Sophisticated patterns for memory, learning, and system integration.

- **[memory-manager](agents/memory-manager.md)** - Contextual continuity through intelligent information storage
- **[learning-adapter](agents/learning-adapter.md)** - Dynamic improvement through experience and feedback
- **[mcp-integrator](agents/mcp-integrator.md)** - Standardized communication with external resources
- **[goal-monitor](agents/goal-monitor.md)** - Executive function providing direction and accountability

### Integration Patterns (12-14)
Patterns for robust system integration and quality assurance.

- **[exception-handler](agents/exception-handler.md)** - Systematic error management and system resilience
- **[human-validator](agents/human-validator.md)** - Strategic human oversight integration for quality control
- **[rag-retriever](agents/rag-retriever.md)** - Dynamic external knowledge access during response generation

### System-Level Patterns (15-21)
Enterprise-grade patterns for production systems and complex environments.

- **[agent-communicator](agents/agent-communicator.md)** - Structured communication infrastructure for agent coordination
- **[resource-optimizer](agents/resource-optimizer.md)** - Dynamic resource monitoring and optimization
- **[reasoning-engine](agents/reasoning-engine.md)** - Systematic logical inference and structured problem-solving
- **[safety-guardian](agents/safety-guardian.md)** - Comprehensive safety mechanisms for acceptable operation bounds
- **[evaluator](agents/evaluator.md)** - Comprehensive performance assessment and system health tracking
- **[prioritizer](agents/prioritizer.md)** - Intelligent task ranking and scheduling based on multiple criteria
- **[explorer](agents/explorer.md)** - Systematic investigation of unknown environments for knowledge acquisition

## Quick Start

### Installation

Run the installation script to set up all agents:

```bash
curl -fsSL https://raw.githubusercontent.com/anti-achismo-social-club/subagents-design-patterns/main/install.sh | bash
```

Or manually copy the agents directory to your AI system's agent folder.

### Basic Usage

Each agent is defined in a markdown file with YAML frontmatter specifying its configuration:

```yaml
---
name: agent-name
description: When and how to use this agent
tools: List, Of, Tools  # Optional - omit to inherit all tools
---
```

### Agent Selection Guidelines

**Use Proactively** (marked with "PROACTIVELY" in description):
- prompt-chainer, router, parallelizer, tool-orchestrator, planner, multi-agent
- goal-monitor, exception-handler, rag-retriever, agent-communicator
- resource-optimizer, safety-guardian, evaluator, prioritizer, explorer

**Use On-Demand**:
- reflector, memory-manager, learning-adapter, mcp-integrator
- human-validator, reasoning-engine

## Examples and Patterns

See the [examples](examples/) directory for:
- **[workflow-examples.md](examples/workflow-examples.md)** - Practical usage scenarios
- **[composition-patterns.md](examples/composition-patterns.md)** - How to combine multiple agents

## Agent Tool Assignments

| Agent | Recommended Tools |
|-------|------------------|
| prompt-chainer | Read, Write, Edit, TodoWrite |
| router | Task, Bash |
| parallelizer | Task, Bash |
| reflector | Read, Grep, Glob |
| tool-orchestrator | (inherits all tools) |
| planner | TodoWrite, Read |
| multi-agent | Task |
| memory-manager | Read, Write, TodoWrite |
| learning-adapter | Read, Write, Bash |
| mcp-integrator | Read, Bash, WebFetch |
| goal-monitor | TodoWrite, Read, Bash |
| exception-handler | Bash, Read, Edit |
| human-validator | Read, Write |
| rag-retriever | Read, Grep, WebSearch |
| agent-communicator | Task, Read |
| resource-optimizer | Bash, Read, Grep |
| reasoning-engine | Read, Grep, Write |
| safety-guardian | Read, Grep |
| evaluator | Read, Bash, Grep |
| prioritizer | TodoWrite, Read, Bash |
| explorer | Grep, Glob, Read, WebSearch |

## Implementation Philosophy

These agents implement the scientific principles from Antonio Gulli's "Agentic Design Patterns":

1. **Pattern-Based Design** - Each agent follows proven design patterns with clear responsibilities
2. **Composability** - Agents can be combined to solve complex problems
3. **Specialization** - Each agent focuses on a specific capability or pattern
4. **Reliability** - Built on tested methodologies from production AI systems
5. **Simplicity** - Clean, understandable implementations focused on core functionality

## Contributing

When adding new agents or modifying existing ones:

1. Follow the established template structure
2. Base implementations on the source patterns from the book
3. Maintain clear separation of concerns
4. Update documentation and examples

## Credits

- **Original Patterns**: Antonio Gulli - "Agentic Design Patterns"
- **Source Repository**: [anti-achismo-social-club/agentic-design-patterns](https://github.com/anti-achismo-social-club/agentic-design-patterns)
- **Architecture Reference**: [wshobson/agents](https://github.com/wshobson/agents)

## License

This implementation is provided as-is for educational and development purposes. Please refer to the original book and repository for licensing terms of the underlying patterns and content.