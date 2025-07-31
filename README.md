# Neovim Configuration for Python & C++ Development

A modern, feature-rich Neovim configuration optimized for Python and C++ development with LSP, autocompletion, and powerful editing tools.

## ✨ Features

### Language Support
- **Python**: Full LSP support with Pyright, virtual environment management, autoformatting
- **C++**: Complete C++ development environment with clangd LSP
- **Additional**: Lua, Bash, R language servers included

### Core Capabilities
- 🚀 Lightning-fast startup with lazy.nvim plugin management
- 🔍 Fuzzy finding with Telescope
- 📝 Intelligent autocompletion with nvim-cmp
- 🌳 Syntax highlighting with Treesitter
- 🔧 Auto-formatting with conform.nvim
- 📦 Virtual environment selection for Python
- 🎨 Beautiful UI with Catppuccin theme

## 🛠️ Installation

### Prerequisites
- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional but recommended)
- C++ compiler (for clangd)
- Python 3.8+ (for Python development)

### Setup
1. Backup your existing Neovim configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Clone this configuration:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. Start Neovim - plugins will install automatically:
   ```bash
   nvim
   ```

## 🎯 Python Development

### Features
- **LSP Server**: Pyright for type checking, IntelliSense, and refactoring
- **Virtual Environment**: Automatic detection and easy switching
- **Formatting**: isort for import sorting
- **Jupyter Support**: Quarto integration for notebook-style development

### Python-Specific Keybindings
| Key | Action |
|-----|--------|
| `<leader>vs` | Select Python virtual environment |
| `<leader>vc` | Use cached virtual environment |

### Getting Started with Python
1. Open a Python project in Neovim
2. Use `<leader>vs` to select your virtual environment
3. LSP will automatically activate with:
   - Hover documentation (`K`)
   - Go to definition (`gd`)
   - Find references (`gr`)
   - Code actions (`<leader>ca`)

## ⚡ C++ Development

### Features
- **LSP Server**: clangd for comprehensive C++ support
- **IntelliSense**: Auto-completion for C++ standard library
- **Error Detection**: Real-time syntax and semantic error checking
- **Refactoring**: Symbol renaming and code transformations

### C++ Setup
1. Ensure you have a C++ compiler installed (gcc, clang, or MSVC)
2. For best results, create a `compile_commands.json` file in your project root
3. clangd will automatically provide rich language features

## 🚀 Key Bindings

### General Navigation
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep search |
| `<leader><leader>` | Browse buffers |
| `<leader>e` | File explorer |
| `tt` | Toggle floating terminal |

### LSP Commands (Python & C++)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `gR` | Rename symbol |
| `<leader>f` | Format code |
| `[d` / `]d` | Navigate diagnostics |

### Window Management
| Key | Action |
|-----|--------|
| `<leader>wv` | Split vertically |
| `<leader>wh` | Split horizontally |
| `<leader>wx` | Close current split |
| `<leader>we` | Equalize splits |

### Terminal
| Key | Action |
|-----|--------|
| `tt` | Toggle floating terminal |
| `<Esc>` (in terminal) | Exit terminal mode |

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                              # Entry point
├── lazy-lock.json                        # Plugin versions lock file
├── lua/
│   ├── core/
│   │   ├── keymaps.lua                   # Global key mappings
│   │   ├── options.lua                   # Neovim settings
│   │   └── autocmds.lua                  # Auto commands
│   └── plugins/
│       ├── lazy.lua                      # Plugin manager setup
│       └── custom/
│           ├── lsp.lua                   # LSP configuration (Pyright, clangd)
│           ├── completion.lua            # nvim-cmp setup
│           ├── telescope.lua             # Fuzzy finder
│           ├── venv-selector.lua         # Python virtual environment
│           ├── autoformat.lua            # Code formatting
│           └── ...                       # Other plugin configs
```

## 🔧 Language Servers

The following language servers are automatically installed:

| Language | Server | Features |
|----------|--------|----------|
| Python | Pyright | Type checking, IntelliSense, imports |
| C++ | clangd | Completion, diagnostics, refactoring |
| Lua | lua_ls | Neovim configuration development |
| Bash | bashls | Shell script support |
| R | r-languageserver | Statistical computing |

## 🎨 UI Features

- **Theme**: Catppuccin colorscheme
- **Status Line**: Custom status line with git integration
- **Buffer Line**: Tab-like buffer navigation
- **Icons**: Nerd Font icons throughout the interface
- **Notifications**: Clean, non-intrusive notifications

## 📚 Plugin Management

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

### Common Commands
- `:Lazy` - Open plugin manager UI
- `:Lazy update` - Update all plugins
- `:Lazy clean` - Remove unused plugins
- `:Mason` - Manage LSP servers

## 🛠️ Customization

### Adding Language Servers
Edit `lua/plugins/custom/lsp.lua` and add your language server to the `ensure_installed` table:

```lua
ensure_installed = {
    "pyright",     -- Python
    "clangd",      -- C++
    "lua_ls",      -- Lua
    "your_server", -- Add here
},
```

### Custom Key Bindings
Add your key bindings to `lua/core/keymaps.lua`:

```lua
keymap.set("n", "<leader>xx", ":YourCommand<CR>", { desc = "Description" })
```

## 🚨 Troubleshooting

### Python Issues
- **Virtual environment not detected**: Use `<leader>vs` to manually select
- **Pyright not working**: Check that Python is in your PATH
- **Import errors**: Ensure your project structure includes `__init__.py` files

### C++ Issues
- **clangd not providing completions**: Create a `compile_commands.json` file
- **Header files not found**: Check include paths in your build system
- **Slow performance**: clangd may be indexing large codebases

### General Issues
- **Plugins not loading**: Run `:Lazy sync` to reinstall
- **LSP not starting**: Check `:LspInfo` for server status
- **Key bindings not working**: Verify no conflicts with terminal/tmux

## 📖 Learning Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [LSP Configuration Guide](https://github.com/neovim/nvim-lspconfig)
- [Telescope Usage](https://github.com/nvim-telescope/telescope.nvim)
- [Python Development in Neovim](https://alpha2phi.medium.com/neovim-for-beginners-python-201e1a1dd5ea)

## 🤝 Contributing

Feel free to submit issues and pull requests to improve this configuration!

## 📄 License

This configuration is open source and available under the [MIT License](LICENSE).
