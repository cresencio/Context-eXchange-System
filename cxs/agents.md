# Welcome to the Context eXchange System (CXS)

**AI Agent Orientation Guide**

---

## What is CXS?

You are now operating within the **Context eXchange System (CXS)** - a lightweight, stack-agnostic framework designed to standardize how humans, AI agents, and tools manage context, execute workflows, and maintain audit trails across projects.

CXS is **not** a domain-specific system. It is **infrastructure** - a neutral foundation that can be dropped into any project, regardless of technology stack, programming language, or business domain.

## Your Role as an AI Agent

When working within CXS, you should:

1. **Respect the Structure**: Use the established directories and follow the documented patterns
2. **Maintain Neutrality**: Keep all work domain-agnostic and technology-neutral
3. **Document Everything**: Log activities, maintain audit trails, and update relevant files
4. **Follow Contracts**: Adhere to the interface specifications defined in contracts
5. **Preserve Context**: Bundle context appropriately for reproducibility

## Core CXS Concepts

### 🏗️ **Directory Structure**
```
cxs/
├── contracts/     # Interface definitions and expectations
├── prompts/       # Standardized prompt templates  
├── project/       # Project-specific configuration templates
├── packs/         # Context bundles for execution cycles
├── cycles/        # Cycle management (current active cycle)
├── ledger/        # Audit logs and execution history
├── outbox/        # Output artifacts and results
└── archive/       # Historical data and retired artifacts
```

### 📋 **Contracts** (`contracts/`)
Contracts define interfaces, rules, and expectations for interactions. Before starting any significant work:

1. **Review applicable contracts** in `contracts/`
2. **Choose the appropriate contract** (process, analyze, document, or custom)
3. **Follow the contract specification** throughout execution
4. **Validate against contract requirements** before completion

Available standard contracts:
- `process.contract` - Generic process execution
- `analyze.contract` - Analysis and insight generation  
- `document.contract` - Documentation creation
- `sample-contract.md` - Example contract structure

### 📝 **Prompts** (`prompts/`)
Use standardized prompt templates for consistent, high-quality outputs:

- `discover.md` - Systematic exploration and mapping
- `schema_extract.md` - Data structure documentation
- `policy_apply.md` - Compliance and governance
- `cost_discipline.md` - Resource optimization analysis
- `handoff_note.md` - Knowledge transfer documentation
- `postmortem.md` - Learning-focused retrospectives
- `verification_checklist.md` - Quality assurance validation

### 📦 **Context Packs** (`packs/`)
When executing work cycles:

1. **Create a context pack** in `packs/` with format: `packs/pack-YYYYMMDD-HHMMSS/`
2. **Include all necessary context**: inputs, configurations, contract references
3. **Document with meta.yaml**: See `packs/_sample_cycle/meta.yaml` for structure
4. **Keep packs self-contained**: Everything needed for reproduction

### 🔄 **Cycle Management**
- **Current cycle**: Check `cycles/current` for active cycle ID
- **Update when starting new cycle**: Echo new cycle ID to `cycles/current`
- **Reference in all work**: Use cycle ID consistently across activities

## Execution Workflow

### 1. **Understand the Context**
- Read the current cycle: `cat cycles/current`
- Review applicable contracts in `contracts/`
- Check project configuration in `project/` (if this is project-specific work)

### 2. **Plan Your Work**
- Choose appropriate contract and prompt templates
- Create context pack if needed: `packs/pack-YYYYMMDD-HHMMSS/`
- Document your plan in the pack's `meta.yaml`

### 3. **Execute Work**
- Follow contract specifications
- Use standardized prompt templates
- Maintain detailed logs of activities
- Generate outputs in `outbox/`

### 4. **Document and Log**
- **Update `ledger/runs.csv`** with execution details:
  ```csv
  timestamp,session_id,cycle_id,contract_ref,agent_id,tokens_or_runtime,status,notes
  ```
- **Add significant events** to `ledger/CHANGELOG_TIMELINE.md`
- **Save outputs** to `outbox/` with clear naming
- **Update context pack** with final status and results

## Key Principles

### 🎯 **Domain Neutrality**
- Use generic, cross-industry language
- Avoid domain-specific terms or examples
- Keep templates and outputs broadly applicable
- Focus on patterns and structures, not specific implementations

### 🔄 **Reproducibility**
- Document all inputs, configurations, and dependencies
- Maintain clear audit trails
- Bundle context completely for future reproduction
- Version all significant changes

### 📊 **Auditability**
- Log all activities in `ledger/runs.csv`
- Document decisions and rationale
- Maintain provenance for all outputs
- Enable future review and analysis

### 🤝 **Collaboration**
- Use clear, standardized interfaces (contracts)
- Document work for easy handoff
- Maintain consistent naming and organization
- Enable team coordination through shared structure

## Common Patterns

### Starting a New Analysis
```bash
# 1. Check current cycle
cat cycles/current

# 2. Create context pack
mkdir packs/pack-20251004-analysis

# 3. Choose contract and prompt
cp contracts/analyze.contract packs/pack-20251004-analysis/
cp prompts/discover.md packs/pack-20251004-analysis/

# 4. Execute work following contract
# [perform analysis work]

# 5. Log the run
echo "2025-10-04T14:30:00Z,session-001,sample-cycle,analyze.contract,ai-agent,5min,completed,Discovery analysis of project structure" >> ledger/runs.csv
```

### Creating Documentation
```bash
# 1. Use documentation contract
cp contracts/document.contract packs/pack-20251004-docs/

# 2. Follow verification checklist
cp prompts/verification_checklist.md packs/pack-20251004-docs/

# 3. Generate outputs to outbox
# [create documentation]
cp final-docs.md outbox/

# 4. Update changelog
echo "Added comprehensive documentation suite" >> ledger/CHANGELOG_TIMELINE.md
```

## Project Integration

If working within a specific project (not just CXS maintenance):

1. **Review `project/` templates** for project-specific guidance
2. **Check `project/manifest.yaml`** for project metadata and constraints
3. **Follow `project/policies.yaml`** for project-specific standards
4. **Reference `project/data_contracts.yaml`** for data interfaces
5. **Use `project/stack_profile.yaml`** to understand technology context

## Quality Standards

### Before Completing Any Work:
- [ ] Contract requirements satisfied
- [ ] Outputs placed in `outbox/` with clear names
- [ ] Execution logged in `ledger/runs.csv`
- [ ] Context pack updated with final status
- [ ] Significant changes noted in `ledger/CHANGELOG_TIMELINE.md`
- [ ] All work maintains domain neutrality
- [ ] Documentation is clear and complete

## Need Help?

- **Examples**: See `sample-contract.md` and `sample-prompt.md`
- **Templates**: All standard templates are in `prompts/`
- **Project Guidance**: Check `project/` folder for project-specific information
- **Sample Pack**: Review `packs/_sample_cycle/meta.yaml` for structure example

## Remember

CXS is designed to be **infrastructure, not application**. Your role is to:
- Work within the system, not modify the system
- Maintain the neutrality and reusability of CXS
- Focus on your specific task while respecting CXS patterns
- Document your work for future agents and humans
- Preserve the ability for any project to use this CXS instance

**Welcome to productive, organized, auditable work within CXS!**