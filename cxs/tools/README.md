# CXS Tools

Validation and utility scripts for the Context eXchange System.

---

## 📋 validate-cxs.sh

**Purpose**: Health check and validation script for CXS deployment and usage.

### Usage

Run from your project root (where `cxs/` folder exists):

```bash
bash cxs/tools/validate-cxs.sh
```

Or from the tools directory:

```bash
cd cxs/tools
bash validate-cxs.sh
```

### What It Checks

**Core Structure** (8 checks):
- ✅ Required directories exist (contracts, packs, ledger, cycles, outbox, prompts, project, archive)

**Essential Files** (4 checks):
- ✅ QUICKSTART.md for token-efficient onboarding
- ✅ agents.md reference guide
- ✅ Contracts available (process, analyze, document)
- ✅ Prompt templates available

**Active Usage** (5 checks):
- ✅ Current cycle is set in `cycles/current`
- ✅ Ledger has logged runs in `ledger/runs.csv`
- ✅ Context packs created in `packs/`
- ✅ Packs have meta.yaml files
- ✅ Outputs placed in `outbox/`
- ✅ CHANGELOG_TIMELINE.md updated

**Configuration** (2 checks):
- ✅ Project configs customized (manifest, policies, stack_profile)
- ✅ JSON Schemas for MCP compatibility (future)

### Output

The script provides:
- Color-coded results (✅ Pass, ⚠️ Warning, ❌ Fail)
- Actionable suggestions for each failure
- Overall health score (0-100%)
- Exit code: 0 if no failures, 1 if any failures

### Health Score Ratings

| Score | Rating | Meaning |
|-------|--------|---------|
| 90%+ | Excellent | CXS properly configured and actively used |
| 75-89% | Good | CXS working, minor improvements recommended |
| 50-74% | Fair | CXS set up but needs attention |
| <50% | Needs Work | Address critical failures before using |

### When to Run

- **After initial setup**: Verify CXS is correctly installed
- **After each work session**: Confirm proper usage patterns
- **Before committing**: Ensure audit trail is complete
- **Troubleshooting**: Identify configuration issues

### Example Output

```
╔════════════════════════════════════════════════════════╗
║         CXS Health Check & Validation                 ║
╚════════════════════════════════════════════════════════╝

🔍 Checking Core Structure...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ PASS - Directory exists: contracts/
✅ PASS - Directory exists: packs/
...

📊 Validation Summary
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ Passed: 16
⚠️  Warnings: 3
❌ Failed: 0

Overall Health Score: 84%
✓ Good! CXS is working. Address warnings to improve.
```

### Automation

Add to Git hooks for continuous validation:

```bash
# .git/hooks/pre-commit
#!/bin/bash
bash cxs/tools/validate-cxs.sh || {
    echo "CXS validation failed. Fix issues before committing."
    exit 1
}
```

Or add to CI/CD pipeline:

```yaml
# .github/workflows/validate-cxs.yml
- name: Validate CXS
  run: bash cxs/tools/validate-cxs.sh
```

---

## 🔮 Future Tools

**Planned additions**:
- `validate-schemas.py` - JSON Schema validation with detailed error messages
- `cxs-init.sh` - Interactive setup wizard for new projects
- `pack-builder.py` - Automated context pack creation
- `ledger-query.py` - Query and analyze ledger data
- `snapshot-create.sh` - Create pack snapshots (Milestone 3)

---

## 🤝 Contributing

To add new tools:
1. Place scripts in `cxs/tools/`
2. Make them executable: `chmod +x script-name.sh`
3. Add documentation to this README
4. Follow CXS principles (domain-neutral, machine-readable where possible)

---

## 📄 License

Same as CXS - MIT License
