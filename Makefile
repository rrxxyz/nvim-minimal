.PHONY: test lint format install-dev clean

# Test commands
test:
	@echo "Running NeoChange tests..."
	nvim --headless --noplugin -u tests/minimal_init.lua -c "PlenaryBustedDirectory tests/"

test-watch:
	@echo "Running tests in watch mode..."
	find . -name "*.lua" | entr -c make test

# Linting and formatting
lint:
	@echo "Linting Lua files..."
	luacheck lua/ tests/ --globals vim

format:
	@echo "Formatting Lua files..."
	stylua lua/ tests/

format-check:
	@echo "Checking Lua formatting..."
	stylua --check lua/ tests/

# Development setup
install-dev:
	@echo "Installing development dependencies..."
	@echo "Please ensure you have the following tools installed:"
	@echo "- luacheck (lua linter)"
	@echo "- stylua (lua formatter)" 
	@echo "- plenary.nvim plugin for testing"

# Clean up
clean:
	@echo "Cleaning up..."
	rm -rf .luacheckcache

# CI tasks
ci: format-check lint test
	@echo "All CI checks passed!"

# Help
help:
	@echo "Available commands:"
	@echo "  test        - Run all tests"
	@echo "  test-watch  - Run tests in watch mode"
	@echo "  lint        - Run luacheck linter"  
	@echo "  format      - Format code with stylua"
	@echo "  format-check- Check if code is formatted"
	@echo "  install-dev - Show development setup instructions"
	@echo "  clean       - Clean up cache files"
	@echo "  ci          - Run all CI checks"
	@echo "  help        - Show this help"