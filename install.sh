#!/bin/bash

# Agentic Design Patterns - Agent Installation Script
# Based on "Agentic Design Patterns" by Antonio Gulli

set -e  # Exit on any error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print functions
print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  Agentic Design Patterns      ${NC}"
    echo -e "${BLUE}  Agent Installation Script    ${NC}"
    echo -e "${BLUE}================================${NC}"
    echo
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Main installation function
main() {
    print_header

    echo "Installing 21 specialized agents based on Antonio Gulli's"
    echo "\"Agentic Design Patterns\" book."
    echo

    # Check if we're in the right directory
    if [[ ! -d "agents" ]]; then
        print_error "agents/ directory not found!"
        print_info "Please run this script from the repository root directory."
        exit 1
    fi

    # Count available agents
    local agent_count=$(find agents -name "*.md" -type f | wc -l | tr -d ' ')
    print_info "Found ${agent_count} agent definition files"

    if [[ $agent_count -ne 21 ]]; then
        print_warning "Expected 21 agents, found ${agent_count}"
        print_info "Installation will continue with available agents"
    fi

    # Display agent categories
    echo
    print_info "Agent Categories:"
    echo "  • Core Patterns (1-7): Fundamental workflow capabilities"
    echo "  • Advanced Patterns (8-11): Memory, learning, integration"
    echo "  • Integration Patterns (12-14): Error handling, validation, RAG"
    echo "  • System Patterns (15-21): Production-grade system management"
    echo

    # List all available agents
    print_info "Available Agents:"
    for agent_file in agents/*.md; do
        if [[ -f "$agent_file" ]]; then
            local agent_name=$(basename "$agent_file" .md)
            local description=$(grep "^description:" "$agent_file" | cut -d':' -f2- | sed 's/^ *//')
            echo "  • ${agent_name}: ${description}"
        fi
    done

    echo
    read -p "Do you want to proceed with installation? (y/N): " -n 1 -r
    echo

    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Installation cancelled."
        exit 0
    fi

    # Detect target system
    detect_and_install

    print_success "Installation completed!"
    echo
    print_info "Next steps:"
    echo "  1. Review the README.md for usage instructions"
    echo "  2. Check examples/ directory for workflow patterns"
    echo "  3. Start with core agents like planner or multi-agent"
    echo
    print_info "Documentation:"
    echo "  • Main README: ./README.md"
    echo "  • Workflow Examples: ./examples/workflow-examples.md"
    echo "  • Composition Patterns: ./examples/composition-patterns.md"
    echo
    print_success "Ready to use agentic design patterns!"
}

# Detect system and install appropriately
detect_and_install() {
    print_info "Detecting installation target..."

    # Check for common AI frameworks and systems
    if command -v anthropic >/dev/null 2>&1; then
        install_anthropic
    elif [[ -f "claude_desktop_config.json" ]] || [[ -f "$HOME/.config/claude-desktop/config.json" ]]; then
        install_claude_desktop
    elif [[ -d ".vscode" ]] && [[ -f "package.json" ]]; then
        install_vscode_project
    elif [[ -f "pyproject.toml" ]] || [[ -f "requirements.txt" ]]; then
        install_python_project
    elif [[ -f "package.json" ]]; then
        install_node_project
    else
        install_generic
    fi
}

# Installation methods for different systems
install_anthropic() {
    print_info "Detected Anthropic CLI environment"

    local target_dir="$HOME/.anthropic/agents"
    mkdir -p "$target_dir"

    print_info "Copying agents to: $target_dir"
    cp -r agents/* "$target_dir/"

    print_success "Agents installed for Anthropic CLI"
}

install_claude_desktop() {
    print_info "Detected Claude Desktop environment"

    local config_dir=""
    if [[ -f "$HOME/.config/claude-desktop/config.json" ]]; then
        config_dir="$HOME/.config/claude-desktop"
    else
        config_dir="."
    fi

    local target_dir="$config_dir/agents"
    mkdir -p "$target_dir"

    print_info "Copying agents to: $target_dir"
    cp -r agents/* "$target_dir/"

    print_success "Agents installed for Claude Desktop"
    print_info "You may need to restart Claude Desktop to see the new agents"
}

install_vscode_project() {
    print_info "Detected VS Code project"

    local target_dir=".vscode/agents"
    mkdir -p "$target_dir"

    print_info "Copying agents to: $target_dir"
    cp -r agents/* "$target_dir/"

    print_success "Agents installed in VS Code project"
}

install_python_project() {
    print_info "Detected Python project"

    local target_dir="./agents"

    print_info "Agents available in: $target_dir"
    print_info "Integration depends on your AI framework"

    print_success "Agents ready for Python project integration"
}

install_node_project() {
    print_info "Detected Node.js project"

    local target_dir="./agents"

    print_info "Agents available in: $target_dir"
    print_info "Integration depends on your AI framework"

    print_success "Agents ready for Node.js project integration"
}

install_generic() {
    print_info "Generic installation"

    print_info "Agents are available in the ./agents directory"
    print_info "Copy them to your AI system's agent directory as needed"

    echo
    print_info "Common locations:"
    echo "  • Claude Desktop: ~/.config/claude-desktop/agents/"
    echo "  • Anthropic CLI: ~/.anthropic/agents/"
    echo "  • Custom system: <your-ai-system>/agents/"

    print_success "Generic installation completed"
}

# Validation function
validate_installation() {
    local target_dir="$1"
    local installed_count=$(find "$target_dir" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')

    if [[ $installed_count -gt 0 ]]; then
        print_success "Validated: ${installed_count} agents installed"
        return 0
    else
        print_error "Validation failed: No agents found in target directory"
        return 1
    fi
}

# Run main function
main "$@"