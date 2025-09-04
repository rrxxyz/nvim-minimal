# 🚀 Neovim Starter Kit Configuration

A modern, optimized Neovim configuration specifically tuned for Python development with Lua configuration management.

This isn't just another Neovim config - it's your foundation for building the perfect development environment for ANY programming language. With our branch-based architecture, you can easily switch between different language setups or create your own specialized configuration.

This configuration provides a complete, production-ready Python development environment built on Neovim's modern plugin ecosystem. It combines the best tools for Python development with sensible defaults and an extensible architecture.

- **🔥 True Starter Kit Philosophy** - Minimal base with extensible examples
- **🌳 Branch-Based Language Support** - Switch between language configurations instantly with NeoChange
- **📚 Educational by Design** - Learn modern Neovim patterns and best practices
- **⚡ Production Ready** - Battle-tested configurations used by real developers
- **🛠️ Community Driven** - Contributions welcome for any programming language

## 🌳 Branch Architecture & NeoChange Integration

- **`main`** - Basic Lua-only starter configuration
- **`ccpp-nvim`** - C/C++ development support
- **`python-nvim`** - **Current branch** - Python-optimized development environment
- **Additional branches** - Language-specific examples you can reference or use

### Current Branch: python-nvim (Python Development Configuration)

This branch provides a comprehensive Python development setup with:
- Complete Python LSP integration with type checking
- Advanced code formatting and linting with modern tools
- Intelligent debugging with virtual environment support
- Python-specific plugins and enhancements
- Optimized editing experience for Python workflows

## What's Included

### Core Features
- **Plugin Management**: lazy.nvim for fast, lazy-loaded plugins
- **LSP Support**: Pyright for Python + lua_ls for Neovim config editing
- **Completion**: blink.cmp with enhanced Python capabilities
- **Syntax Highlighting**: Tree-sitter with Python, TOML, Dockerfile parsers
- **File Navigation**: Telescope for fuzzy finding
- **Git Integration**: Advanced git signs and hunk navigation
- **Modern UI**: Clean theme with statusline and bufferline

### Python Development Features
- **Language Server**: Pyright with intelligent type checking and analysis
- **Code Formatting**: Black (88-char) + isort for imports
- **Linting**: Ruff for fast, comprehensive Python linting
- **Debugging**: Full DAP integration with debugpy and virtual environment support
- **Virtual Environments**: Smart venv detection and switching with venv-selector
- **Enhanced Navigation**: Python-specific text objects and motions
- **Code Quality**: Auto-formatting on save, diagnostic integration

### What Makes This Different
- **Python-optimized** - Every tool specifically chosen for Python development
- **Production-ready** - Complete toolchain for professional Python projects
- **Modern tooling** - Uses latest Python development tools (Ruff, Black, Pyright)
- **Virtual env aware** - Intelligent handling of Python virtual environments
- **Well-integrated** - All tools work together seamlessly

## Requirements

- Neovim >= 0.10.0
- Python 3.8+ (for debugpy and language server)
- Git
- A C compiler (for telescope-fzf-native and some Python packages)

### Python Development Tools (Auto-installed)

Mason will automatically install:
- `pyright` - Python language server with type checking
- `ruff` - Fast Python linter and formatter
- `black` - Python code formatter
- `isort` - Python import sorter  
- `debugpy` - Python debugging adapter
- `lua-language-server` - For Neovim configuration editing
- `stylua` - Lua code formatting

### Optional Enhancements
- **Virtual Environment**: pipenv, poetry, conda, or venv for project isolation
- **Python Type Checker**: mypy (if using alongside Pyright)
- **Git**: For version control integration features

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

3. **Switch to Python branch**:
   ```bash
   cd ~/.config/nvim
   git checkout python-nvim  # For Python development environment
   ```

5. **Start Neovim**:
   ```bash
   nvim
   ```

6. **Let lazy.nvim install plugins** (this happens automatically on first run)

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
│       ├── lsp.lua            # LSP configuration
│       ├── completion.lua     # Completion engine
│       ├── editor.lua         # Core editing plugins
│       ├── ui.lua             # UI enhancements
│       └── debug.lua          # Debugging support
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

### LSP & Python Development
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gI` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `<Space>ca` | Code actions |
| `<Space>cr` | Rename |
| `<Space>cf` | Format with Black + isort |
| `<Space>vs` | Select virtual environment |

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

### Debugging (Python DAP)
| Key | Action |
|-----|--------|
| `<Space>db` | Toggle breakpoint |
| `<Space>dB` | Conditional breakpoint |
| `<Space>dc` | Continue/Start debugging |
| `<Space>di` | Step into |
| `<Space>do` | Step over |
| `<Space>dO` | Step out |
| `<Space>dr` | Toggle REPL |
| `<Space>du` | Toggle DAP UI |
| `<Space>dt` | Terminate session |

### Buffer Management
| Key | Action |
|-----|--------|
| `<Space>bd` | Delete buffer |
| `<Space>bb` | Switch to other buffer |
| `<Space>bp` | Toggle pin buffer |

## Getting Started

### Quick Start for Python Development
1. Open any `.py` file - Mason will automatically install Python tools
2. Use `<Space>vs` to select your virtual environment
3. Start coding with full IntelliSense, formatting, and linting
4. Use `<Space>db` to set breakpoints and `<Space>dc` to start debugging
5. Auto-formatting happens on save (Black + isort)

### Setting Up a Python Project
1. Create or activate your virtual environment:
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # or `.venv\Scripts\activate` on Windows
   ```
2. Open Neovim in your project directory
3. Use `<Space>vs` to select the `.venv` environment
4. Install your project dependencies as usual

### For Customization
- **Add more languages**: Check other branches for examples
- **Change Python settings**: Modify `lua/plugins/lsp.lua`
- **Adjust formatting**: Edit Black/isort config in `lua/plugins/editor.lua`
- **Change theme**: Modify `lua/plugins/ui.lua`
- **Add plugins**: Create new files in `lua/plugins/`
- **Modify keybinds**: Edit `lua/config/keymaps.lua`

## Available Branches

### main Branch
Basic Lua-only configuration - minimal starter setup for Neovim configuration development.

### ccpp-nvim Branch  
C/C++ development environment with clangd, debugging, and build tool integration.

### python-nvim Branch (Current)
Complete Python development environment with modern tooling and full debugging support.

### Your Own Branch
Consider creating your own branch for your specific setup:
```bash
git checkout -b my-python-config
# Add your customizations
git add -A && git commit -m "My personal Python config"
```

## 🔄 Switching Between Configurations

### Method 1: Using NeoChange (Recommended)
```vim
:NeoChange ccpp-nvim     " Switch to C/C++ configuration
:NeoChange main          " Switch to base configuration
```

### Method 2: Manual Git Commands
```bash
# Switch to basic Lua-only configuration
git checkout main

# Switch to C/C++ development configuration  
git checkout ccpp-nvim

# Switch to Python development configuration
git checkout python-nvim

# After switching, restart Neovim to reload configuration
```

## Python Development Workflow

### Daily Usage
1. **Start your session**:
   ```bash
   cd your-python-project
   source .venv/bin/activate  # Activate your virtual environment
   nvim .  # Open Neovim
   ```

2. **Select virtual environment**: `<Space>vs` if not automatically detected

3. **Code with confidence**:
   - Full IntelliSense with type hints
   - Real-time linting with Ruff
   - Auto-formatting on save with Black + isort
   - Instant error detection and suggestions

4. **Debug efficiently**:
   - Set breakpoints: `<Space>db`
   - Start debugging: `<Space>dc`
   - Use the visual DAP UI: `<Space>du`

### Advanced Python Customization

#### Adjusting Python Settings

**Modify LSP behavior** in `lua/plugins/lsp.lua`:
```lua
pyright = {
  python = {
    analysis = {
      typeCheckingMode = "strict", -- Change from "basic"
      autoImportCompletions = true,
    },
  },
},
```

**Customize formatting** in `lua/plugins/editor.lua`:
```lua
formatters_by_ft = {
  python = { "ruff_format", "ruff_organize_imports" }, -- Use ruff instead
  -- or: python = { "isort", "black" }, -- Current setup
},
```

#### Adding Python Tools

Add more Python-specific tools to Mason:
```lua
ensure_installed = {
  -- ... existing tools ...
  "mypy",      -- Additional type checking
  "pytest",    -- Testing framework
  "bandit",    -- Security linter
},
```

#### Adding More Plugins

Create a new file like `lua/plugins/my-additions.lua`:
```lua
return {
  -- Your additional plugins here
  {
    "your-plugin/name",
    config = function()
      -- Plugin configuration
    end,
  },
}
```

### Learning Resources

- Read the `ccpp-nvim` branch to see a real extension example
- Check each plugin's documentation for more configuration options
- The lazy.nvim documentation explains the plugin specification format

## Troubleshooting

### Python LSP Issues
1. **Pyright not working**:
   - Check LSP status: `:LspInfo`
   - Ensure Python is in PATH: `:!python --version`
   - Check Mason installation: `:Mason`
   - Restart LSP: `:LspRestart`

2. **Virtual environment not detected**:
   - Use `:VenvSelect` or `<Space>vs` to manually select
   - Ensure .venv or venv folder exists in project root
   - Check Python path: `:lua print(vim.fn.exepath('python'))`

3. **Type hints not working**:
   - Install typing stubs: `pip install types-requests` (for example)
   - Check pyright settings in `:LspInfo`
   - Verify Python path points to correct environment

### Formatting/Linting Issues  
1. **Black not formatting**:
   - Check conform status: `:ConformInfo`
   - Manually format: `<Space>cf`
   - Check Mason installation: `:Mason`

2. **Ruff not linting**:
   - Check nvim-lint status: `:lua print(require('lint').get_running())`
   - Manually trigger: `:lua require('lint').try_lint()`

### Debugging Issues
1. **DAP not starting**:
   - Check debugpy installation: `:Mason`
   - Verify Python path in debug configuration
   - Check DAP status: `:lua print(require('dap').session())`

2. **Breakpoints not working**:
   - Ensure file is saved
   - Check if debugpy is running in the environment
   - Try restarting debug session: `<Space>dt` then `<Space>dc`

### General Issues
- Check health: `:checkhealth`
- Update plugins: `:Lazy update`
- Check Python version compatibility (3.8+ required)
- Ensure you're on the python-nvim branch: `git branch`

## 🤝 Contributing to the Starter Kit

**We need your help to make this the ultimate Neovim starter kit for ANY programming language!**

### 🎯 Most Wanted Contributions

**New Language Branches** - Help expand our starter kit ecosystem:
- 🐍 **Python** (`python-nvim` branch) - Data science, web dev, automation
- 🦀 **Rust** (`rust-nvim` branch) - Systems programming with rust-analyzer
- 🐹 **Go** (`go-nvim` branch) - Cloud-native development
- ⚡ **JavaScript/TypeScript** (`js-nvim` branch) - Modern web development
- 🔷 **C#** (`csharp-nvim` branch) - .NET development
- 🐘 **PHP** (`php-nvim` branch) - Web development
- ☕ **Java** (`java-nvim` branch) - Enterprise development
- And many more!

### 📋 Contribution Guidelines

#### For New Language Branches
1. **Fork and create a new branch** from `main`
2. **Add comprehensive language support** (LSP, formatters, debuggers)
3. **Keep it production-ready** - real developers should be able to use it immediately
4. **Document everything** - explain your choices and configurations
5. **Test thoroughly** - ensure everything works out of the box

#### For the Main Branch
- **Keep it minimal** - Only essential features that benefit all users
- **Improve documentation** - Help newcomers understand modern Neovim
- **Fix bugs** - Ensure the foundation is rock-solid

### 🚀 Quick Start for Contributors

```bash
# Create your language branch
git checkout main
git checkout -b python-nvim  # or your language

# Add your configuration
# Test thoroughly
# Submit a PR with detailed description

# Your branch becomes part of the starter kit ecosystem!
```

### 🌟 Recognition

All contributors get:
- Recognition in README.md
- Credit as branch maintainers  
- Community appreciation for expanding the starter kit ecosystem

## Inspiration & Credits

This Python-optimized configuration builds upon:
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - Educational approach and solid foundations
- [LazyVim](https://github.com/LazyVim/LazyVim) - Modern plugin architecture patterns
- Python community best practices for development tooling
- Real-world Python development workflows and pain points

### Key Python Tools Used
- **Pyright** - Microsoft's Python language server
- **Ruff** - Astral's extremely fast Python linter
- **Black** - The uncompromising Python code formatter  
- **isort** - Python import sorting utility
- **debugpy** - Python debugging adapter protocol implementation

## License

This configuration is available under the MIT license. Feel free to use, modify, and share!
