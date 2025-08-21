# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a modular Neovim configuration optimized for Python, C++, Rust, and Lua development. The configuration uses lazy.nvim for plugin management and is structured with core configuration files separate from plugin-specific settings.

## Architecture

### Core Structure
- `init.lua` - Entry point that loads core configuration and bootstraps lazy.nvim
- `lua/config/` - Core Neovim configuration modules:
  - `options.lua` - Basic Neovim options and settings
  - `keymaps.lua` - Global key mappings
  - `autocmds.lua` - Autocommands
  - `lazy.lua` - Bootstrap lazy.nvim plugin manager
- `lua/plugins/` - Plugin configurations loaded automatically by lazy.nvim

### Plugin System
The configuration uses lazy.nvim's automatic loading system where each file in `lua/plugins/` is treated as a plugin specification. Plugins are loaded on-demand based on events, filetypes, or commands.

### LSP Architecture
LSP configuration is centralized in `lua/plugins/lsp.lua` using:
- `mason.nvim` for automatic LSP server installation
- `nvim-lspconfig` for server configuration
- `blink.cmp` for completion capabilities
- Telescope integration for LSP navigation (definitions, references, etc.)

## Language Server Support

Currently configured language servers:
- **Python**: `pyright` - Type checking, IntelliSense, imports
- **C++**: `clangd` - Completion, diagnostics, refactoring
- **Lua**: `lua_ls` - Neovim configuration development
- **Bash**: `bashls` - Shell script language support
- **Kotlin**: `kotlin_lsp` and `gradle_ls` - Kotlin and Gradle support
- **Rust**: `rustaceanvim` (dedicated plugin, not standard rust-analyzer LSP config)

To add new language servers:
1. Add server name to the `servers` table in `lua/plugins/lsp.lua`
2. Server will be automatically installed via Mason

## Key Mapping Conventions

- Leader key: `<Space>`
- LSP mappings use `g` prefix (gd, gr, gi, etc.)
- Telescope searches use `<leader>s` prefix
- Formatting: `<leader>f`
- Diagnostics: `<leader>q` for quickfix list, `[d` and `]d` for navigation

## Development Commands

### Plugin Management
- `:Lazy` - Open lazy.nvim plugin manager
- `:Lazy update` - Update all plugins
- `:Lazy clean` - Remove unused plugins

### LSP Management
- `:Mason` - Open Mason for managing LSP servers and tools
- `:LspInfo` - Show LSP server status
- `:ConformInfo` - Show formatter configuration

### Testing and Linting
Check the README.md for specific language setup requirements. No global test or lint commands are configured - these are language-specific.

## Code Formatting

Formatting is handled by `conform.nvim` with language-specific formatters:
- **Lua**: `stylua`
- **Python**: `isort` + `black` (sequential)
- **C++**: `clang-format` (disabled for format-on-save)
- **Kotlin**: `ktlint`

Format on save is enabled by default except for C/C++ files. Manual formatting available via `<leader>f`.

## Adding New Plugins

Create a new `.lua` file in `lua/plugins/` with the plugin specification. The file will be automatically loaded by lazy.nvim. Follow the existing pattern of returning a table with plugin configuration.

## Git Integration

The configuration includes git integration via gitsigns with keymaps for hunk navigation (`]c`, `[c`), staging (`<leader>hs`), and git blame (`<leader>hb`).

## Rust Development

This configuration includes comprehensive Rust support via `rustaceanvim` plugin, which provides enhanced features beyond standard LSP:
- Inlay hints and enhanced diagnostics
- Integrated testing and debugging capabilities  
- Rust-specific code actions and refactoring tools
- Cargo integration and project management

See `lua/plugins/rustaceanvim.lua` and `after/ftplugin/rust.lua` for Rust-specific configurations and keymaps.

## File Management

File management is handled by the plugin configured in `lua/plugins/filemanager.lua`. Check this file for available file browser commands and keymaps.