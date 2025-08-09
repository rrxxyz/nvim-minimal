# Neovim Configuration for Python, C++, Rust & Lua Development

A modern, feature-rich Neovim configuration optimized for Python, C++, Rust, and Lua development with LSP, autocompletion, and powerful editing tools.

## ✨ Features

### Language Support
- **Python**: Full LSP support with Pyright, autoformatting with isort & black
- **C++**: Complete C++ development environment with clangd LSP, formatting with clang-format
- **Rust**: Full support with rust-analyzer LSP
- **Lua**: Configured for Neovim configuration development with stylua formatting
- **Bash**: Shell script support with bashls

### Core Capabilities
- 🚀 Lightning-fast startup with lazy.nvim plugin management
- 🔍 Fuzzy finding with Telescope (files, grep, buffers, help, keymaps)
- 📝 Intelligent autocompletion with blink.cmp and friendly-snippets
- 🌳 Syntax highlighting with Treesitter
- 🔧 Auto-formatting with conform.nvim (Python: isort + black, Lua: stylua, JS: prettier, C++: clang-format)
- 🎨 Beautiful UI with status line and buffer management
- 📋 Floating terminal with toggle functionality
- 🔄 Undo tree visualization
- 🔍 TODO comment highlighting
- 📊 Git integration with gitsigns (hunks, blame, staging)
- 🔔 Which-key for keybinding discovery
- 💬 Code commenting with Comment.nvim
- 🔗 Auto-pairing brackets and quotes

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

## 🎯 Language-Specific Development

### Python
- **LSP Server**: Pyright for type checking, IntelliSense, and refactoring
- **Formatting**: Automatic formatting with isort (imports) and black (code)
- **Features**: Hover documentation (`K`), go to definition (`gd`), find references (`gr`), code actions (`<leader>ca`)

### Rust
- **LSP Server**: rust-analyzer for comprehensive Rust development
- **Features**: Intelligent completion, type hints, error diagnostics, and refactoring
- **Integration**: Full LSP integration with all standard keybindings

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
| `jk` (insert mode) | Exit insert mode |
| `<ESC>` | Clear search highlights |
| `<leader>e` | File explorer |
| `<leader>w` | Save file |
| `<leader>W` | Save all files |
| `<leader>q` | Save and quit |
| `<leader>sp` | Search and replace |

### Telescope (Search & Navigation)
| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep search |
| `<leader>sw` | Search current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sh` | Search help |
| `<leader>sk` | Search keymaps |
| `<leader>ss` | Search Telescope commands |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Search recent files |
| `<leader>s/` | Search in open files |
| `<leader>sn` | Search Neovim config files |
| `<leader><leader>` | Browse buffers |
| `<leader>/` | Fuzzy search in current buffer |

### LSP Commands (Python & C++)
| Key | Action |
|-----|--------|
| `gD` | Go to declaration |
| `gd` | Go to definition (Telescope) |
| `gi` | Go to implementation (Telescope) |
| `gr` | Find references (Telescope) |
| `gt` | Go to type definition (Telescope) |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `gR` | Rename symbol |
| `<leader>f` | Format code |
| `<leader>d` | Open diagnostic float |
| `[d` / `]d` | Navigate diagnostics |
| `<leader>lr` | Restart LSP |


### Window Management
| Key | Action |
|-----|--------|
| `<leader>wv` | Split vertically |
| `<leader>wh` | Split horizontally |
| `<leader>wx` | Close current split |
| `<leader>we` | Equalize splits |

### Text Editing
| Key | Action |
|-----|--------|
| `J` (visual) | Move selected text down |
| `K` (visual) | Move selected text up |
| `<leader>[q` | Previous quickfix item |
| `<leader>]q` | Next quickfix item |

### Terminal
| Key | Action |
|-----|--------|
| `tt` | Toggle floating terminal |
| `<Esc>` (in terminal) | Exit terminal mode |

### Git (Gitsigns)
| Key | Action |
|-----|--------|
| `]c` | Next git change |
| `[c` | Previous git change |
| `<leader>hs` | Stage hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle git blame line |
| `<leader>tD` | Toggle git show deleted |

### Utilities
| Key | Action |
|-----|--------|
| `<leader>u` | Toggle undo tree |
| `<leader>cm` | Open Mason (LSP manager) |

### Completion (Insert Mode)
| Key | Action |
|-----|--------|
| `<C-k>` | Previous completion item |
| `<C-j>` | Next completion item |
| `<C-b>` | Scroll docs up |
| `<C-f>` | Scroll docs down |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<CR>` | Confirm completion |
| `<Tab>` | Next completion/snippet |
| `<S-Tab>` | Previous completion/snippet |

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
│           ├── completion.lua            # blink.cmp setup
│           ├── telescope.lua             # Fuzzy finder
│           ├── autoformat.lua            # Code formatting
│           └── ...                       # Other plugin configs
```

## 🔧 Language Servers

The following language servers are automatically installed:

| Language | Server | Features |
|----------|--------|----------|
| Python | Pyright | Type checking, IntelliSense, imports |
| C++ | clangd | Completion, diagnostics, refactoring |
| Rust | rust-analyzer | Completion, diagnostics, refactoring, type hints |
| Lua | lua_ls | Neovim configuration development |
| Bash | bashls | Shell script support |

## 🎨 UI Features

- **Theme**: Default colorscheme
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
- **Pyright not working**: Check that Python is in your PATH
- **Import errors**: Ensure your project structure includes `__init__.py` files

### Rust Issues
- **rust-analyzer not working**: Ensure Rust toolchain is installed via rustup
- **Slow performance**: rust-analyzer may be building/indexing the project
- **Missing completions**: Check that Cargo.toml is present in project root

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
