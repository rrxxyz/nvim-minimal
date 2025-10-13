# Personal Neovim Configuration

A modern Neovim configuration optimized for multi-language development with Lua-based configuration.

This is my personal setup designed for daily programming work across multiple languages including Lua, C/C++, Rust, Python, and Kotlin. It combines powerful language tooling with essential Neovim functionality for a productive development environment.

## Current Branch: personal

This is my personal development setup supporting multiple languages for daily use:
- **Lua** - Primary language for Neovim configuration
- **C/C++** - Systems programming and performance-critical code
- **Rust** - Modern systems programming with safety guarantees
- **Python** - Scripting, automation, and data processing
- **Kotlin** - Android and JVM development

## What's Included

### Multi-Language Support
- **Lua** - lua_ls with full Neovim API support and stylua formatting
- **C/C++** - clangd LSP with intelligent completion and diagnostics
- **Rust** - rust-analyzer, rustaceanvim, CodeLLDB debugging, Cargo integration, and crates.nvim
- **Python** - pyright/basedpyright for type checking and intelligent code analysis
- **Kotlin** - kotlin-language-server for Android and JVM development

### Core Editor Features
- **Plugin Management**: lazy.nvim for fast, lazy-loaded plugins
- **LSP Support**: Language servers for all supported languages with optimized configurations
- **Completion**: blink.cmp for modern, context-aware completion experience
- **Syntax Highlighting**: Tree-sitter with multi-language support
- **File Navigation**: Advanced fuzzy finding and project navigation
- **Git Integration**: Comprehensive git workflow support with gitsigns and fugitive
- **Debugging**: DAP support for multiple languages
- **Note Taking**: Obsidian.nvim integration for markdown-based knowledge management
- **Modern UI**: Clean, distraction-free interface

### What Makes This Setup
- **Multi-language ready** - Configured for Lua, C/C++, Rust, Python, and Kotlin
- **Personal workflow** - Tailored to my daily development needs
- **Performance-focused** - Fast startup and responsive editing
- **Complete toolchain** - Everything needed for polyglot development

## Requirements

- Neovim >= 0.10.0
- Rust toolchain (rustc, cargo) - Install via [rustup](https://rustup.rs/)
- Git
- A C compiler (for building native dependencies)

### Rust Development Tools (Auto-installed)

Mason will automatically install:
- `rust-analyzer` - Rust language server for intelligent code analysis
- `codelldb` - LLDB-based debugger for Rust applications
- `rustfmt` - Rust code formatting tool
- `lua-language-server` - For Neovim configuration editing
- `stylua` - Lua code formatting

### External Dependencies

These should be available in your system PATH:
- `cargo` - Rust package manager (included with Rust installation)
- `clippy` - Rust linter (install with `rustup component add clippy`)
- `lldb` - System debugger (usually pre-installed on macOS/Linux)

## Installation

1. **Backup your existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   Linux:
   ```bash
   git clone https://github.com/rizkirakasiwi/nvim-minimal.git ~/.config/nvim
   ```
   Windows:
   - powershell
     ```bash
     git clone https://github.com/rizkirakasiwi/nvim-minimal.git "${env:LOCALAPPDATA}\nvim"
     ```
   - cmd
     ```bash
     git clone https://github.com/rizkirakasiwi/nvim-minimal.git "%localappdata%\nvim"
     ```

4. **Ensure Rust is installed**:
   ```bash
   # Install Rust if you haven't already
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   
   # Add clippy component
   rustup component add clippy
   ```

5. **Start Neovim**:
   ```bash
   nvim
   ```

6. **Let lazy.nvim install plugins** (this happens automatically on first run)

7. **Verify installation**:
   - Open a Rust file or create a new one: `nvim main.rs`
   - Check LSP status: `:LspInfo`
   - Check Mason installations: `:Mason`

## File Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua        # Vim options and settings
│   │   ├── keymaps.lua        # Key mappings
│   │   └── autocmds.lua       # Auto commands
│   └── plugins/
│       ├── coding/            # Coding tools (LSP, completion, Mason)
│       ├── dap/               # Debugging support
│       ├── editor/            # Core editing plugins
│       ├── lang/              # Language-specific plugins
│       │   └── markdown.lua   # Markdown & Obsidian configuration
│       └── ui/                # UI enhancements
├── CLAUDE.md                   # Claude Code instructions
└── README.md                   # This file
```

## Key Bindings

### General
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<C-s>` | Save file |
| `<Esc>` | Clear search highlight |

### Navigation
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate windows |
| `<S-h/l>` | Navigate buffers |
| `<C-Up/Down/Left/Right>` | Resize windows |

### File Management
| Key | Action |
|-----|--------|
| `<Space>e` | Toggle file explorer |
| `<Space>ff` | Find files |
| `<Space>fg` | Find text (live grep) |
| `<Space>fb` | Find buffers |
| `<Space>fr` | Recent files |

### LSP & Rust Development
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gI` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `<Space>ca` | Code actions |
| `<Space>cR` | Rust code actions |
| `<Space>cr` | Rename |
| `<Space>cf` | Format |

### Rust-Specific Commands
| Key | Action |
|-----|--------|
| `<Space>rt` | Run tests (`cargo test`) |
| `<Space>rc` | Run check (`cargo check`) |
| `<Space>rb` | Build project (`cargo build`) |
| `<Space>rr` | Run project (`cargo run`) |
| `<Space>rC` | Run clippy (`cargo clippy`) |

### Debugging
| Key | Action |
|-----|--------|
| `<Space>dr` | Run Rust debuggables |
| `<Space>db` | Toggle breakpoint |
| `<Space>dc` | Continue debugging |
| `<Space>di` | Step into |
| `<Space>do` | Step out |
| `<Space>dO` | Step over |
| `<Space>dt` | Terminate debug session |
| `<Space>du` | Toggle debug UI |

### Diagnostics
| Key | Action |
|-----|--------|
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |
| `<Space>cd` | Document diagnostics |
| `<Space>cD` | Workspace diagnostics |
| `<Space>xx` | Toggle Trouble |

### Git
| Key | Action |
|-----|--------|
| `]h` | Next git hunk |
| `[h` | Previous git hunk |
| `<Space>ghs` | Stage hunk |
| `<Space>ghr` | Reset hunk |
| `<Space>ghp` | Preview hunk |
| `<Space>ghb` | Blame line |

### Buffer Management
| Key | Action |
|-----|--------|
| `<Space>bd` | Delete buffer |
| `<Space>bb` | Switch to other buffer |
| `<Space>bp` | Toggle pin buffer |

### Obsidian Note Taking
| Key | Action |
|-----|--------|
| `<Space>oo` | Open note in Obsidian app |
| `<Space>on` | Create new note |
| `<Space>os` | Search notes |
| `<Space>oq` | Quick switch between notes |
| `<Space>og` | Search by tags |
| `<Space>ol` | Show links in current note |
| `<Space>ob` | Show backlinks to current note |
| `<Space>ow` | Switch workspace |
| `<Space>od` | Open today's daily note |
| `<Space>oy` | Open yesterday's note |
| `<Space>ot` | Insert template |
| `<Space>oe` | Extract selection to new note (visual mode) |
| `<Space>op` | Paste image from clipboard |
| `<Space>or` | Rename current note |
| `<Space>of` | Follow link under cursor |
| `<Space>oc` | Toggle checkbox |
| `gf` | Go to file/follow link in vault |
| `<CR>` | Smart action (follow link or toggle checkbox) |

## Getting Started with Rust Development

### Quick Start
1. **Create a new Rust project**:
   ```bash
   cargo new my_project
   cd my_project
   nvim src/main.rs
   ```

2. **Test the setup**:
   - Write some Rust code and observe syntax highlighting
   - Use `<Space>rc` to run `cargo check`
   - Use `<Space>rt` to run tests
   - Try `gd` to go to a function definition

3. **Explore features**:
   - Open `Cargo.toml` and add a dependency - crates.nvim will provide completion
   - Set a breakpoint with `<Space>db` and debug with `<Space>dr`
   - Use `<Space>ca` for code actions like importing traits

### Rust Development Workflow

1. **Code**: Write Rust with intelligent completion and real-time diagnostics
2. **Check**: Use `<Space>rc` for quick syntax and type checking
3. **Test**: Run specific tests or all tests with `<Space>rt`
4. **Debug**: Set breakpoints and debug interactively
5. **Build**: Use `<Space>rb` for release builds
6. **Lint**: Run `<Space>rC` for clippy suggestions

### Working with Cargo.toml
- Open any `Cargo.toml` file
- Start typing a crate name - you'll get intelligent completion
- Hover over versions to see available updates
- Use code actions to update dependencies

## Note Taking with Obsidian

### Setup
The configuration integrates [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) for seamless markdown note-taking within Neovim:
- **Vault Locations**:
  - `~/Notes/Personal/` - Personal notes and projects
  - `~/Notes/Work/` - Work-related notes and documentation
- **UI Disabled**: Prevents conflicts with markdown preview plugins
- **Telescope Integration**: Use Telescope for fuzzy finding notes
- **Auto-loading**: Activates for markdown files in your vaults
- **Workspace Switching**: Use `<Space>ow` to switch between Work and Personal vaults

### Getting Started with Obsidian
1. **Create your vault directories**:
   ```bash
   mkdir -p ~/Notes/Personal
   mkdir -p ~/Notes/Work
   ```

2. **Open a note**:
   ```bash
   # Personal vault
   nvim ~/Notes/Personal/my-note.md

   # Work vault
   nvim ~/Notes/Work/project-notes.md
   ```

3. **Start taking notes**:
   - Use `<Space>on` to create new notes
   - Use `<Space>os` to search existing notes
   - Use `[[link]]` syntax for wiki-style links
   - Use `gf` or `<CR>` to follow links

### Obsidian Workflow
1. **Switch workspace**: Use `<Space>ow` to switch between Personal and Work vaults
2. **Quick capture**: Use `<Space>on` to quickly create a new note (auto-adds date/time frontmatter)
3. **Daily notes**: Use `<Space>od` for today's journal entry (vault-specific)
4. **Link notes**: Create connections with `[[note-name]]` syntax
5. **Find connections**: Use `<Space>ob` to see what links to current note
6. **Tag organization**: Add `#tags` and search with `<Space>og`
7. **Template system**: Use `<Space>ot` to insert predefined templates (default, meeting)
8. **Image support**: Paste images directly with `<Space>op`
9. **Search across vault**: Use `<Space>os` to search notes in current workspace

### Automatic Frontmatter
Every new note automatically includes:
```markdown
---
id: note-name
aliases: []
tags: []
date: 2025-10-13
created: 2025-10-13 16:30
---
```

### Obsidian Features
- **Multiple workspaces**: Separate Personal and Work vaults for organization
- **Auto-frontmatter**: New notes automatically include date, time, and metadata
- **Wiki-style links**: Automatic completion for `[[links]]`
- **Backlinks**: See all notes linking to current note
- **Daily notes**: Automatic daily note creation and navigation (per workspace)
- **Templates**: Reusable note templates with variable substitution
  - `default.md` - Basic note template
  - `meeting.md` - Meeting notes with attendees, agenda, and action items
  - Variables: `{{date}}`, `{{time}}`, `{{title}}`
- **Tags**: Search and organize with hashtags
- **Checkboxes**: Toggle with `<Space>oc`
- **Quick switch**: Rapidly navigate between recent notes
- **Workspace isolation**: Each vault maintains its own note structure and links

### Template Locations
Templates are stored in each vault's `templates/` directory:
- Personal: `~/Notes/Personal/templates/`
- Work: `~/Notes/Work/templates/`

To create custom templates, add `.md` files with frontmatter variables like `{{date}}`, `{{time}}`, and `{{title}}`.

## Customization Guide

### Adding Rust-Specific Plugins

Create `lua/plugins/rust-extras.lua`:
```lua
return {
  {
    "simrat39/rust-tools.nvim", -- Alternative to rustaceanvim
    ft = "rust",
    config = function()
      -- Additional Rust tooling
    end,
  },
}
```

### Customizing rust-analyzer Settings

Modify the rust-analyzer configuration in `lua/plugins/lsp.lua`:
```lua
rust_analyzer = {
  ["rust-analyzer"] = {
    cargo = {
      allFeatures = true,
      buildScripts = { enable = true },
    },
    checkOnSave = {
      command = "clippy",
      extraArgs = { "--no-deps" },
    },
    -- Add more settings here
  },
},
```

### Adding More Cargo Commands

Extend `lua/config/keymaps.lua`:
```lua
-- Custom Cargo commands
keymap.set("n", "<leader>rd", "<cmd>!cargo doc --open<cr>", { desc = "Cargo Doc" })
keymap.set("n", "<leader>rR", "<cmd>!cargo run --release<cr>", { desc = "Cargo Run Release" })
```

## Troubleshooting

### Rust LSP Not Working
1. **Check rust-analyzer installation**:
   ```bash
   :Mason
   # Ensure rust-analyzer is installed
   ```

2. **Verify Rust toolchain**:
   ```bash
   rustc --version
   cargo --version
   ```

3. **Check LSP status**: `:LspInfo` - should show rust-analyzer attached

4. **Check project setup**: Ensure you're in a Cargo project (has `Cargo.toml`)

### Debugging Issues
1. **CodeLLDB not found**:
   ```bash
   :Mason
   # Install codelldb if missing
   ```

2. **Breakpoints not working**: Ensure you're building with debug symbols:
   ```bash
   cargo build  # Not cargo build --release
   ```

### Performance Issues
1. **Slow rust-analyzer**: Add to your `Cargo.toml`:
   ```toml
   [profile.dev]
   incremental = true
   ```

2. **High memory usage**: rust-analyzer can be memory intensive on large projects

### Completion Issues
1. **No completions**: Wait for rust-analyzer to finish indexing (check bottom-right status)
2. **Outdated completions**: Try `:LspRestart`

### Cargo Integration Issues
1. **Commands not working**: Ensure `cargo` is in your PATH
2. **Wrong directory**: Cargo commands run from Neovim's current working directory

## Advanced Rust Features

### Macro Expansion
Use rustaceanvim's macro expansion feature:
```
:RustLsp expandMacro
```

### View HIR/MIR
Inspect Rust's intermediate representations:
```
:RustLsp view hir
:RustLsp view mir
```

### Inlay Hints
rust-analyzer provides helpful inlay hints for:
- Type information
- Parameter names
- Closure parameter types
- Return types

### Code Actions
Advanced code actions available:
- Import missing items
- Fill match arms
- Generate missing impl blocks
- Convert between string types
- Extract functions and variables

## 🤝 Contributing to the Starter Kit

This project welcomes contributions for Rust-specific improvements:

### Rust Development Focus
- **Enhance Rust tooling** - Improve rust-analyzer configuration
- **Add Rust plugins** - Integrate new Rust-specific tools
- **Improve debugging** - Better debugging configurations and workflows
- **Documentation** - Help other Rust developers get started

### Guidelines
- **Rust-first approach** - Prioritize Rust development experience
- **Performance matters** - Keep configurations optimized for speed
- **Real-world usage** - Test with actual Rust projects
- **Clear documentation** - Help other developers understand the setup

## Inspiration

This Rust-focused configuration draws inspiration from:
- [rust-analyzer](https://rust-analyzer.github.io/) - Official Rust language server
- [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) - Superior Rust experience in Neovim  
- [LazyVim](https://github.com/LazyVim/LazyVim) - Modern plugin architecture
- The Rust community's development practices and workflows

## License

This configuration is available under the MIT license. Feel free to use, modify, and share!
