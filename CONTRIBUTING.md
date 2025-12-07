# Contributing to CXS

Guidelines for contributing to the Context eXchange System, whether you're a human developer or an AI agent.

---

## 🔄 Starting a New Cycle

A **cycle** represents a discrete unit of work (a session, sprint, task, or phase).

### Create a New Cycle

```bash
# Format: descriptive-name-YYYYMMDD or semantic identifier
echo "feature-auth-20251207" > cxs/cycles/current

# Or use the automation script
python cxs/tools/cxs_cli.py new-cycle "feature-auth"
```

### Cycle Naming Conventions

| Pattern | Example | Use Case |
|---------|---------|----------|
| `feature-{name}-{date}` | `feature-auth-20251207` | New feature development |
| `fix-{issue}-{date}` | `fix-login-20251207` | Bug fixes |
| `refactor-{area}-{date}` | `refactor-api-20251207` | Code improvements |
| `docs-{topic}-{date}` | `docs-onboarding-20251207` | Documentation work |
| `cycle-{number}` | `cycle-042` | Sequential numbering |

---

## 📦 Creating Context Packs

Context packs bundle all inputs, configurations, and references for reproducible work.

### Manual Pack Creation

```bash
# Create pack directory with timestamp
PACK="cxs/packs/pack-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$PACK"

# Copy relevant contract
cp cxs/contracts/process.contract "$PACK/"

# Create metadata file
cat > "$PACK/meta.yaml" << EOF
cycle_id: $(cat cxs/cycles/current)
created: $(date -Iseconds)
contract: process.contract
description: "Brief description of this pack's purpose"
inputs: []
outputs: []
EOF
```

### Using the CLI Tool

```bash
# Create a new pack with scaffolding
python cxs/tools/cxs_cli.py new-pack --contract process --description "Data analysis task"
```

### Pack Structure

```
packs/pack-20251207-143022/
├── meta.yaml           # Required: Pack metadata
├── contract.md         # Contract reference (copy or symlink)
├── inputs/             # Input files or references
├── config/             # Configuration files
└── notes.md            # Optional: Working notes
```

---

## 📝 Logging Runs

Every execution should be logged to `cxs/ledger/runs.csv` for auditability.

### Ledger Schema

```csv
timestamp,session_id,cycle_id,contract_ref,agent_id,tokens_or_runtime,status,notes
```

| Field | Description | Example |
|-------|-------------|---------|
| `timestamp` | ISO 8601 datetime | `2025-12-07T14:30:00Z` |
| `session_id` | Unique session identifier | `session-001` |
| `cycle_id` | Current cycle from `cycles/current` | `feature-auth-20251207` |
| `contract_ref` | Contract used | `process.contract` |
| `agent_id` | Who executed (human/AI identifier) | `claude`, `gpt4`, `developer-jane` |
| `tokens_or_runtime` | Resource consumption | `1500 tokens`, `5min`, `2.3s` |
| `status` | Execution status | `completed`, `failed`, `partial` |
| `notes` | Brief description | `Implemented user authentication` |

### Manual Logging

```bash
# Append a run entry
echo "$(date -Iseconds),session-001,$(cat cxs/cycles/current),process.contract,developer,15min,completed,Task description" >> cxs/ledger/runs.csv
```

### Using the CLI Tool

```bash
# Log a run with validation
python cxs/tools/cxs_cli.py log-run \
  --session "session-001" \
  --contract "process.contract" \
  --agent "claude" \
  --runtime "5min" \
  --status "completed" \
  --notes "Completed data processing task"
```

### Validate Ledger

```bash
# Check ledger format and schema compliance
python cxs/tools/validate_ledger.py
```

---

## 📤 Packaging Outputs

All outputs should be placed in `cxs/outbox/` with clear naming.

### Output Naming Conventions

```
outbox/
├── {cycle-id}-{artifact-name}.{ext}     # Cycle-prefixed
├── {date}-{description}.{ext}            # Date-prefixed
└── {pack-id}-output.{ext}                # Pack-prefixed
```

### Examples

```bash
# Place outputs with descriptive names
cp analysis-results.json cxs/outbox/feature-auth-20251207-analysis.json
cp report.md cxs/outbox/2025-12-07-auth-implementation-report.md
```

### Linking Outputs to Packs

Update the pack's `meta.yaml` to reference outputs:

```yaml
outputs:
  - path: outbox/feature-auth-20251207-analysis.json
    type: data
    description: Analysis results in JSON format
  - path: outbox/2025-12-07-auth-implementation-report.md
    type: documentation
    description: Implementation summary report
```

---

## 📋 Updating the Changelog

For significant events, update `cxs/ledger/CHANGELOG_TIMELINE.md`:

```markdown
---

## {Event Title}

**Date:** YYYY-MM-DD  
**Cycle:** {cycle-id}  
**Event:** {Brief event description}  
**Details:** {Detailed explanation of what happened, decisions made, outcomes}
```

---

## ✅ Contribution Checklist

Before completing any contribution:

- [ ] Cycle is set in `cycles/current`
- [ ] Context pack created (if applicable)
- [ ] Work follows appropriate contract
- [ ] Outputs placed in `outbox/` with clear names
- [ ] Run logged in `ledger/runs.csv`
- [ ] Significant events noted in `CHANGELOG_TIMELINE.md`
- [ ] Pack `meta.yaml` updated with final status
- [ ] Ledger validates: `python cxs/tools/validate_ledger.py`

---

## 🧹 Code Quality

### Linting and Validation

```bash
# Validate CXS structure and usage
bash cxs/tools/validate-cxs.sh

# Validate ledger schema
python cxs/tools/validate_ledger.py

# Lint markdown files (requires markdownlint)
npx markdownlint-cli2 "cxs/**/*.md"
```

### Domain Neutrality

All contributions must maintain domain neutrality:

- ❌ Avoid industry-specific terminology
- ❌ No technology-specific assumptions
- ✅ Use generic, cross-domain language
- ✅ Provide abstract examples that apply broadly

---

## 🔀 Pull Request Process

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/your-feature`
3. **Make changes** following CXS patterns
4. **Validate**: Run `bash cxs/tools/validate-cxs.sh`
5. **Commit** with clear messages
6. **Push** and create a Pull Request
7. **Describe** changes and link to related issues

### Commit Message Format

```
type(scope): brief description

- Detail 1
- Detail 2

Refs: #issue-number
```

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`

---

## 📚 Additional Resources

- **Quick Start**: `cxs/QUICKSTART.md` (~400 tokens)
- **Agent Guide**: `cxs/agents.md` (~1000 tokens)
- **Tools Documentation**: `cxs/tools/README.md`
- **Sample Pack**: `cxs/packs/_sample_cycle/meta.yaml`

---

**Thank you for contributing to CXS! Your work helps make context management reproducible, auditable, and collaborative.**
