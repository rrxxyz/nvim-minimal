# 🚀 Neovim Starter Kit Configuration

**A modular, language-agnostic Neovim configuration designed as a complete starter kit for any programming language.**

This isn't just another Neovim config - it's your foundation for building the perfect development environment for ANY programming language. With our branch-based architecture, you can easily switch between different language setups or create your own specialized configuration.

## 🎯 Why Choose This Starter Kit?

- **🔥 True Starter Kit Philosophy** - Minimal base with extensible examples
- **🌳 Branch-Based Language Support** - Switch between language configurations instantly with NeoChange
- **📚 Educational by Design** - Learn modern Neovim patterns and best practices
- **⚡ Production Ready** - Battle-tested configurations used by real developers
- **🛠️ Community Driven** - Contributions welcome for any programming language

## 🌳 Branch Architecture & NeoChange Integration

This repository uses a powerful branch-based approach that lets you switch between different programming language configurations seamlessly:

### Available Starter Configurations:

- **`main`** - 🟢 **Pure Starter Base** - Lua-optimized foundation (Start here!)
- **`ccpp-nvim`** - 🔷 **C/C++ Development** - Complete C/C++ development environment
- **More coming soon!** - Community contributions for Python, Go, Rust, JavaScript, etc.

### 🔄 Easy Branch Switching with NeoChange

**NEW!** You can now switch between different language configurations instantly using **NeoChange**:

```vim
" Switch to C/C++ development environment
:NeoChange ccpp-nvim

" Switch back to minimal Lua base
:NeoChange main

" NeoChange will automatically:
" - Switch git branches
" - Restart Neovim with new configuration
" - Handle plugin management seamlessly
```

*No more manual git commands or configuration headaches!*

### Current Branch: Main (Basic Configuration)

This branch provides a minimal but functional Neovim setup with:
- Essential plugins for modern editing
- Sensible defaults that work out of the box
- Clean, readable code you can easily understand and modify
- A foundation you can build upon for your specific needs

## What's Included

### Core Features
- **Plugin Management**: lazy.nvim for fast, lazy-loaded plugins
- **LSP Support**: Basic LSP setup with lua_ls (easily extensible)
- **Completion**: blink.cmp for modern completion experience
- **Syntax Highlighting**: Tree-sitter for accurate highlighting
- **File Navigation**: Telescope for fuzzy finding
- **Git Integration**: Basic git signs and navigation
- **Modern UI**: Clean theme with statusline

### What Makes This Different
- **Minimal by design** - Only essential plugins included
- **Well-documented** - Every configuration choice is clear and commented
- **Easily extensible** - Add language support, themes, or plugins without conflicts
- **Educational** - Learn how each piece works together

## Requirements

- Neovim >= 0.10.0
- Git
- A C compiler (for telescope-fzf-native)

### Basic Tools (Auto-installed)

Mason will automatically install:
- `lua-language-server` - For Neovim configuration editing
- `stylua` - Lua code formatting

*Note: This is intentionally minimal. Add more tools as you need them for your specific languages and workflows.*

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

4. **Switch to desired branch** (optional):
   ```bash
   cd ~/.config/nvim
   git checkout ccpp-nvim  # For C/C++ + Lua support
   # Or stay on main for Lua-only optimization
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

### LSP
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
| `<Space>cf` | Format |

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

## Getting Started

### For Beginners
1. Use this configuration as-is to get familiar with modern Neovim
2. Read through the configuration files to understand how everything works
3. Gradually add customizations based on your needs

### For Customization
- **Add languages**: Check the `ccpp-nvim` branch for examples
- **Change theme**: Modify `lua/plugins/ui.lua`
- **Add plugins**: Create new files in `lua/plugins/`
- **Modify keybinds**: Edit `lua/config/keymaps.lua`

## Example Branches

### ccpp-nvim Branch
Shows how to extend this base configuration with:
- C/C++ language server (clangd)
- Additional formatters and tools
- Debugging support
- More treesitter parsers

### Your Own Branch
Consider creating your own branch for your specific setup:
```bash
git checkout -b my-config
# Add your customizations
git add -A && git commit -m "My personal config"
```

## 🔄 Switching Between Configurations

### Method 1: Using NeoChange (Recommended)
```vim
:NeoChange ccpp-nvim     " Switch to C/C++ configuration
:NeoChange main          " Switch to base configuration
```

### Method 2: Manual Git Commands
```bash
# Switch to C/C++ + Lua configuration
git checkout ccpp-nvim

# Switch back to Lua-only configuration  
git checkout main

# After switching, restart Neovim to reload configuration
```

**Pro Tip:** Use NeoChange for seamless switching - it handles everything automatically!

## Customization Guide

### Philosophy: Start Small, Add What You Need

This configuration is intentionally minimal. Instead of removing features you don't want, you add only what you need.

### Common Customizations

#### Adding a New Language (e.g., Python)

1. **Add LSP server** in `lua/plugins/lsp.lua`:
   ```lua
   ensure_installed = {
     "stylua",
     "lua-language-server",
     "pyright", -- Add this
   }
   ```

2. **Add server configuration**:
   ```lua
   servers = {
     lua_ls = { ... },
     pyright = {}, -- Add this
   }
   ```

3. **Add treesitter** in `lua/plugins/editor.lua`:
   ```lua
   ensure_installed = {
     "lua",
     "python", -- Add this
   }
   ```

4. **Add formatter** (optional):
   ```lua
   formatters_by_ft = {
     lua = { "stylua" },
     python = { "black" }, -- Add this
   }
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

### LSP Not Working
1. Check LSP status: `:LspInfo`
2. Check Mason installations: `:Mason`
3. Check logs: `:LspLog`

### Performance Issues
1. Check startup time: `nvim --startuptime startup.log`
2. Profile plugins: `:Lazy profile`

### Completion Not Working
1. Check blink.cmp capabilities: `:lua print(vim.inspect(require('blink.cmp').get_lsp_capabilities()))`
2. Restart LSP: `:LspRestart`

### Branch-Specific Issues
- Ensure you're on the correct branch: `git branch`
- After switching branches, restart Neovim completely
- Check branch-specific tool requirements

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

## Inspiration

This configuration is inspired by:
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - The educational approach
- [LazyVim](https://github.com/LazyVim/LazyVim) - Modern plugin architecture
- Community feedback and real-world usage patterns

## License

This configuration is available under the MIT license. Feel free to use, modify, and share!
