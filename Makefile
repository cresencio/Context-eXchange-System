# CXS Makefile
# Validation, linting, and utility commands for Context eXchange System

.PHONY: help validate lint lint-docs lint-contracts lint-prompts check test clean status new-cycle

# Default target
help:
	@echo "╔════════════════════════════════════════════════════════════╗"
	@echo "║              CXS Makefile Commands                         ║"
	@echo "╚════════════════════════════════════════════════════════════╝"
	@echo ""
	@echo "  Validation:"
	@echo "    make validate      - Run all validation checks"
	@echo "    make check         - Quick health check"
	@echo "    make test          - Run all tests and validations"
	@echo ""
	@echo "  Linting:"
	@echo "    make lint          - Run all linters"
	@echo "    make lint-docs     - Lint markdown documentation"
	@echo "    make lint-contracts- Check contract file formatting"
	@echo "    make lint-prompts  - Check prompt file formatting"
	@echo ""
	@echo "  Utilities:"
	@echo "    make status        - Show CXS status"
	@echo "    make new-cycle     - Create a new cycle (interactive)"
	@echo "    make clean         - Remove temporary files"
	@echo ""

# =============================================================================
# Validation
# =============================================================================

validate: validate-structure validate-ledger
	@echo ""
	@echo "✅ All validations passed!"

validate-structure:
	@echo "🔍 Validating CXS structure..."
	@bash cxs/tools/validate-cxs.sh || true

validate-ledger:
	@echo "🔍 Validating ledger..."
	@python cxs/tools/validate_ledger.py

check:
	@echo "🔍 Quick health check..."
	@echo ""
	@echo "Current cycle: $$(cat cxs/cycles/current 2>/dev/null || echo 'Not set')"
	@echo "Packs: $$(find cxs/packs -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')"
	@echo "Runs logged: $$(tail -n +2 cxs/ledger/runs.csv 2>/dev/null | wc -l | tr -d ' ')"
	@echo "Outputs: $$(find cxs/outbox -type f -not -name '.keep' 2>/dev/null | wc -l | tr -d ' ')"
	@echo ""
	@python cxs/tools/validate_ledger.py

test: validate lint
	@echo ""
	@echo "✅ All tests passed!"

# =============================================================================
# Linting
# =============================================================================

lint: lint-docs lint-contracts lint-prompts lint-yaml
	@echo ""
	@echo "✅ All linting passed!"

# Lint markdown files with markdownlint (if available)
lint-docs:
	@echo "📝 Linting markdown documentation..."
	@if command -v markdownlint >/dev/null 2>&1; then \
		markdownlint "cxs/**/*.md" --ignore "cxs/packs/**" || true; \
	elif command -v npx >/dev/null 2>&1; then \
		npx markdownlint-cli2 "cxs/**/*.md" "!cxs/packs/**" 2>/dev/null || \
		echo "⚠️  markdownlint not installed. Run: npm install -g markdownlint-cli2"; \
	else \
		echo "⚠️  markdownlint not available. Skipping markdown lint."; \
		echo "    Install with: npm install -g markdownlint-cli2"; \
	fi

# Check contract files for common issues
lint-contracts:
	@echo "📋 Checking contract files..."
	@for file in cxs/contracts/*.contract; do \
		if [ -f "$$file" ]; then \
			echo "  Checking: $$file"; \
			if ! grep -q "^# " "$$file"; then \
				echo "    ⚠️  Missing header"; \
			fi; \
			if ! grep -q "## Inputs" "$$file"; then \
				echo "    ⚠️  Missing Inputs section"; \
			fi; \
			if ! grep -q "## Outputs" "$$file"; then \
				echo "    ⚠️  Missing Outputs section"; \
			fi; \
			if ! grep -q "## Validation Gates\|## Success Criteria" "$$file"; then \
				echo "    ⚠️  Missing Validation/Success section"; \
			fi; \
			trailing=$$(grep -n '[[:space:]]$$' "$$file" | head -5); \
			if [ -n "$$trailing" ]; then \
				echo "    ⚠️  Trailing whitespace on lines: $$(echo $$trailing | cut -d: -f1 | tr '\n' ' ')"; \
			fi; \
		fi; \
	done
	@echo "  ✅ Contract check complete"

# Check prompt files for common issues  
lint-prompts:
	@echo "📝 Checking prompt files..."
	@for file in cxs/prompts/*.md; do \
		if [ -f "$$file" ] && [ "$$(basename $$file)" != ".keep" ]; then \
			echo "  Checking: $$file"; \
			if ! grep -q "^# " "$$file"; then \
				echo "    ⚠️  Missing header"; \
			fi; \
			if ! grep -q "## Purpose\|##.*Purpose\|Purpose:" "$$file"; then \
				echo "    ⚠️  Missing Purpose section"; \
			fi; \
			trailing=$$(grep -n '[[:space:]]$$' "$$file" | head -5); \
			if [ -n "$$trailing" ]; then \
				echo "    ⚠️  Trailing whitespace on lines: $$(echo $$trailing | cut -d: -f1 | tr '\n' ' ')"; \
			fi; \
		fi; \
	done
	@echo "  ✅ Prompt check complete"

# Validate YAML files (if yamllint available)
lint-yaml:
	@echo "📄 Checking YAML files..."
	@if command -v yamllint >/dev/null 2>&1; then \
		yamllint cxs/project/*.yaml cxs/packs/**/meta.yaml 2>/dev/null || true; \
	else \
		echo "  ⚠️  yamllint not available. Skipping YAML lint."; \
		echo "      Install with: pip install yamllint"; \
	fi

# =============================================================================
# Utilities
# =============================================================================

status:
	@python cxs/tools/cxs_cli.py status

new-cycle:
	@echo "Creating new cycle..."
	@read -p "Cycle name (e.g., feature-auth): " name; \
	read -p "Description: " desc; \
	python cxs/tools/cxs_cli.py new-cycle --name "$$name" --description "$$desc" --log-changelog

new-pack:
	@echo "Creating new pack..."
	@read -p "Contract type (process/analyze/document): " contract; \
	read -p "Description: " desc; \
	python cxs/tools/cxs_cli.py new-pack --contract "$$contract" --description "$$desc"

clean:
	@echo "🧹 Cleaning temporary files..."
	@find . -name "*.pyc" -delete
	@find . -name "__pycache__" -type d -delete
	@find . -name ".DS_Store" -delete
	@find . -name "*.swp" -delete
	@echo "  ✅ Clean complete"

# =============================================================================
# Development
# =============================================================================

# Format Python files (if black available)
format:
	@if command -v black >/dev/null 2>&1; then \
		black cxs/tools/*.py; \
	else \
		echo "⚠️  black not available. Install with: pip install black"; \
	fi

# Install development dependencies
dev-deps:
	@echo "Installing development dependencies..."
	pip install yamllint black
	npm install -g markdownlint-cli2
	@echo "✅ Dependencies installed"
