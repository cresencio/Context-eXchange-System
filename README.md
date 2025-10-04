# Context eXchange System (CXS)

**A lightweight, stack-agnostic framework for managing context between humans, AI agents, and tools.**

CXS standardizes contracts, packs, sessions, and ledgers so projects stay reproducible, explainable, and collaboration-ready across any technology stack or workflow.

## 🎯 What is CXS?

The Context eXchange System is **drop-in infrastructure** that provides:

- **📋 Contracts**: Standardized interfaces and expectations for work
- **📦 Packs**: Bundled context for reproducible execution cycles  
- **🔄 Sessions**: Tracked execution cycles with complete audit trails
- **📊 Ledgers**: Historical logs for accountability and learning

CXS is **domain-neutral** and **stack-agnostic** - it works equally well for data science, web development, infrastructure, documentation, or any other domain.

## 🚀 Quick Start

### 1. **Clone or Download CXS**
```bash
# Clone the repository
git clone https://github.com/cresencio/Context-eXchange-System.git
cd Context-eXchange-System

# Or download and extract the cxs/ folder into your project
```

### 2. **Copy CXS into Your Project**
```bash
# Copy the entire cxs/ folder to your project root
cp -r Context-eXchange-System/cxs/ /path/to/your/project/
```

### 3. **Onboard Your AI Agent**
Copy and paste this prompt to your AI agent:

```
🤖 **AI Agent Onboarding Prompt** (Copy/Paste This)

You are now working with the Context eXchange System (CXS). Please read and understand the cxs/agents.md file, which contains your complete orientation guide.

Key points:
- CXS is domain-neutral infrastructure for context management
- Follow contracts in cxs/contracts/ for work specifications  
- Use prompt templates in cxs/prompts/ for consistent outputs
- Create context packs in cxs/packs/ for reproducible work
- Log all activities in cxs/ledger/runs.csv
- Place outputs in cxs/outbox/
- Maintain domain neutrality and audit trails

Current cycle: Check cxs/cycles/current for the active cycle ID.

Start by reading cxs/agents.md for complete instructions, then proceed with your assigned tasks following CXS patterns.
```

### 4. **Start Your First Cycle**
```bash
# Update the current cycle
echo "project-kickoff-$(date +%Y%m%d)" > cxs/cycles/current

# Your agent can now begin work following CXS patterns
```

## 📁 Repository Structure

```
Context-eXchange-System/
├── README.md                    # This file - repository overview
├── LICENSE                      # MIT license
└── cxs/                        # 👈 The complete CXS framework
    ├── agents.md               # AI agent orientation guide
    ├── README.md               # CXS user documentation  
    ├── LICENSE                 # CXS license
    ├── contracts/              # Interface specifications
    │   ├── process.contract    # Generic process execution
    │   ├── analyze.contract    # Analysis standardization
    │   ├── document.contract   # Documentation generation
    │   └── sample-contract.md  # Contract template example
    ├── prompts/                # Standardized prompt templates
    │   ├── discover.md         # Systematic exploration
    │   ├── schema_extract.md   # Data schema documentation
    │   ├── policy_apply.md     # Compliance framework
    │   ├── cost_discipline.md  # Resource optimization
    │   ├── handoff_note.md     # Knowledge transfer
    │   ├── postmortem.md       # Retrospective analysis
    │   ├── verification_checklist.md # Quality assurance
    │   └── sample-prompt.md    # Prompt template example
    ├── project/                # Project configuration templates
    │   ├── manifest.yaml       # Project metadata
    │   ├── discover.yaml       # Discovery configuration
    │   ├── stack_profile.yaml  # Technology stack info
    │   ├── structure_map.yaml  # Project organization
    │   ├── functional_requirements.yaml # Requirements spec
    │   ├── data_contracts.yaml # Data interfaces
    │   └── policies.yaml       # Standards and policies
    ├── packs/                  # Context pack storage
    │   └── _sample_cycle/      # Example context pack
    ├── cycles/                 # Cycle management
    │   └── current             # Current active cycle ID
    ├── ledger/                 # Audit logs and history
    │   ├── runs.csv            # Execution log
    │   └── CHANGELOG_TIMELINE.md # Event timeline
    ├── outbox/                 # Output artifacts
    ├── archive/                # Historical data
```

## 🎨 Use Cases

CXS works for any project or domain:

- **🔬 Data Science**: Manage datasets, models, and analysis workflows
- **💻 Software Development**: Track features, bugs, and deployment cycles  
- **📊 Business Intelligence**: Document reports, dashboards, and insights
- **🏗️ Infrastructure**: Manage deployments, configurations, and incidents
- **📚 Documentation**: Organize knowledge, guides, and specifications
- **🔍 Research**: Track experiments, findings, and methodologies

## 🏗️ Core Concepts

### Contracts
Define clear interfaces and expectations before starting work. Choose from:
- **Process**: Generic workflow execution
- **Analyze**: Data analysis and insights  
- **Document**: Documentation generation
- **Custom**: Create domain-specific contracts

### Context Packs
Bundle everything needed for reproducible work:
- Input data and configurations
- Contract specifications
- Dependencies and requirements  
- Execution metadata

### Audit Trails
Complete history of all activities:
- Execution logs in CSV format
- Timeline of significant events
- Provenance for all outputs
- Performance and quality metrics

## 🔧 Integration Examples

### Python Data Science Project
```python
# Check current cycle
with open('cxs/cycles/current', 'r') as f:
    cycle_id = f.read().strip()

# Log analysis run
import csv
with open('cxs/ledger/runs.csv', 'a') as f:
    writer = csv.writer(f)
    writer.writerow([
        '2025-10-04T14:30:00Z',
        'analysis-session-001', 
        cycle_id,
        'analyze.contract',
        'data-scientist',
        '45min',
        'completed',
        'Customer segmentation analysis'
    ])
```

### Node.js Web Application
```javascript
// Create context pack for feature development
const fs = require('fs');
const packDir = `cxs/packs/pack-${new Date().toISOString().slice(0,10)}-feature`;
fs.mkdirSync(packDir, { recursive: true });

// Reference appropriate contract
fs.copyFileSync('cxs/contracts/process.contract', `${packDir}/contract.md`);
```

### Bash Automation
```bash
#!/bin/bash
# Start new deployment cycle
echo "deployment-$(date +%Y%m%d-%H%M)" > cxs/cycles/current

# Log deployment activity  
echo "$(date -Iseconds),deploy-001,$(cat cxs/cycles/current),process.contract,devops-team,15min,completed,Production deployment v2.1.0" >> cxs/ledger/runs.csv
```

## 🏆 Benefits

### For Teams
- **Standardized Workflows**: Everyone follows the same patterns
- **Clear Handoffs**: Complete context transfer between team members
- **Audit Compliance**: Full history for regulatory requirements
- **Knowledge Retention**: Institutional knowledge preserved in structured format

### For AI Agents
- **Consistent Interface**: Same patterns across all projects and domains
- **Complete Context**: All necessary information bundled and accessible
- **Quality Gates**: Built-in validation and verification processes
- **Learning Capability**: Historical data for improving future performance

### For Projects
- **Reproducible Results**: Any work can be recreated from context packs
- **Technology Agnostic**: Works with any programming language or framework
- **Scalable Organization**: Structure grows with project complexity
- **Future-Proof**: Domain-neutral design adapts to changing requirements

## 📚 Documentation

- **`cxs/agents.md`** - Complete AI agent orientation guide
- **`cxs/README.md`** - CXS user documentation and examples
- **`cxs/contracts/`** - Interface specifications and examples
- **`cxs/prompts/`** - Standardized prompt templates
- **`cxs/project/`** - Project configuration templates

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch  
3. Make changes while maintaining domain neutrality
4. Test with multiple project types
5. Submit a pull request

### Development Principles
- **Domain Neutral**: Keep all templates and examples generic
- **Stack Agnostic**: No technology-specific assumptions
- **Self-Documenting**: Clear examples and comprehensive documentation
- **Backward Compatible**: Changes shouldn't break existing usage

## 📄 License

MIT License - See [LICENSE](LICENSE) for details.

The CXS framework is designed to be freely used, modified, and distributed in any project or organization.

## 🔗 Links

- **Repository**: https://github.com/cresencio/Context-eXchange-System
- **Issues**: https://github.com/cresencio/Context-eXchange-System/issues
- **Discussions**: https://github.com/cresencio/Context-eXchange-System/discussions

---

**Ready to bring structure, reproducibility, and clarity to your projects? Copy the `cxs/` folder and start your first context-managed cycle today!**
