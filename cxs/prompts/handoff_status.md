# Handoff Status Check

**Purpose:** Review recent work and context when joining an ongoing project cycle.

**When to Use:** First action when starting a new session or handoff between agents.

---

## Workflow

### 1. Identify Current Cycle
```bash
cat cycles/current
```

**Check:**
- What cycle ID is active?
- Does it indicate project phase or timeline?

### 2. Review Recent Activity
```bash
tail -n 5 ledger/runs.csv
```

**Look for:**
- Latest timestamp (when was last work done?)
- Session IDs (continuity or new sessions?)
- Contract references (what type of work?)
- Status (completed, in-progress, failed?)
- Notes (brief description of work)

### 3. Check Outbox for Deliverables
```bash
ls -lt outbox/ | head -n 10
```

**Examine:**
- Most recent files by modification date
- Read latest deliverable documentation
- Understand what was produced

### 4. Identify Context Packs
```bash
ls -lt packs/ | head -n 5
```

**If packs exist:**
- Check most recent pack's `meta.yaml`
- Review inputs and contract used
- Understand work parameters

### 5. Synthesize Status Summary

Provide a concise summary covering:

```
Current Cycle: [cycle-id]

Recent Work (Last 1-3 Entries):
- [timestamp]: [brief description from ledger]
- [timestamp]: [brief description from ledger]

Latest Deliverable:
- File: [path]
- Summary: [what was created]
- Artifacts: [where to find outputs]

System State:
- Active context packs: [count]
- Total logged runs: [count]
- Last activity: [how long ago]

Ready for: [next logical step based on recent work]
```

---

## Example Response

```
Current Cycle: sample-cycle

Recent Work (Last 2 Entries):
- 2025-10-04T13:23:14: Created quick_prediction_report.R helper script
  for generating formatted CSV prediction reports (~58k tokens, completed)

Latest Deliverable:
- File: outbox/quick_prediction_report_deliverable.md
- Summary: Helper script that generates formatted CSV reports from existing
  NFL prediction data, matching Shiny app display format
- Artifacts:
  - scripts/helpers/quick_prediction_report.R
  - predictions/week1_2025_report.csv (16 games)
  - predictions/week5_2025_report.csv (14 games)

System State:
- Active context packs: 0 (deliverable-only workflow)
- Total logged runs: 1
- Last activity: Today (current session)

Ready for: Next task assignment or continuation of prediction report workflow
```

---

## Token Efficiency Notes

⚡ **This prompt is ~600 tokens** - Use at session start for context awareness

**Just-in-Time Reading:**
- Only read FULL outbox deliverables if they're recent (within current cycle)
- For older work, ledger notes are sufficient
- Don't read all packs - focus on most recent 1-2

**When NOT to Use:**
- If you're explicitly told this is a fresh start (new cycle)
- If user provides full context in their initial message
- If continuing mid-task (context already loaded)

---

## Integration with CXS Workflow

**Standard Workflow:**
1. Check current cycle
2. Select contract
3. Create context pack
4. Execute work
5. Log execution

**Handoff Workflow:**
0. **🔄 Run handoff status check** (this prompt)
1. Check current cycle ✓ (already done)
2. Select contract (based on next task)
3. Create context pack
4. Execute work
5. Log execution

The handoff check becomes **Step 0** before starting standard workflow.
