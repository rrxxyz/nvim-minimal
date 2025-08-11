# nvim-minimal: Minimal Neovim Configuration

A minimal and modular Neovim configuration forked from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

This configuration takes the solid foundation of kickstart.nvim and restructures it into a more modular architecture:
- **Modular Design**: Core configuration separated from plugins for easier customization
- **Easy to Extend**: Add new plugins by simply creating files in `lua/plugins/`
- **Well-Organized**: Clear separation between options, keymaps, autocommands, and plugin configs
- **Beginner-Friendly**: Heavily commented with clear explanations

## 🛠️ Installation

### Prerequisites
- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional but recommended)

### Setup
1. Backup your existing Neovim configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Clone this configuration:
   ```bash
    git clone https://github.com/rizkirakasiwi/nvim-minimal.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
   ```

3. Start Neovim - plugins will install automatically:
   ```bash
   nvim
   ```

## 🚀 Key Bindings

### General Navigation
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<ESC>` | Clear search highlights |

### Window Management
| Key | Action |
|-----|--------|
| `<C-h>` | Move focus to left window |
| `<C-l>` | Move focus to right window |
| `<C-j>` | Move focus to lower window |
| `<C-k>` | Move focus to upper window |

### Text Editing
| Key | Action |
|-----|--------|
| `J` (visual) | Move selected line down |
| `K` (visual) | Move selected line up |
| `]q` | Next quickfix item |
| `[q` | Previous quickfix item |

### Terminal
| Key | Action |
|-----|--------|
| `<Esc><Esc>` (in terminal) | Exit terminal mode |

### Telescope (Search & Navigation)
| Key | Action |
|-----|--------|
| `<leader>sf` | Search files |
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

### LSP Commands (When LSP is attached)
| Key | Action |
|-----|--------|
| `gD` | Go to declaration |
| `gd` | Go to definition (Telescope) |
| `gi` | Go to implementation (Telescope) |
| `gR` | Find references (Telescope) |
| `gr` | Rename symbol |
| `gt` | Go to type definition (Telescope) |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `ga` | Code actions |
| `<leader>th` | Toggle inlay hints |
| `<leader>q` | Open diagnostic quickfix list |

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                              # Entry point - loads core config
├── lua/
│   ├── config/                           # Core Neovim configuration
│   │   ├── autocmds.lua                  # Autocommands
│   │   ├── keymaps.lua                   # Global key mappings
│   │   ├── lazy.lua                      # Bootstrap lazy.nvim
│   │   └── options.lua                   # Neovim settings & options
│   └── plugins/                          # Plugin configurations (auto-loaded)
│       ├── colorscheme.lua               # Theme configuration
│       ├── completion.lua                # blink.cmp autocompletion
│       ├── formatting.lua                # Code formatting with conform.nvim
│       ├── lsp.lua                       # LSP configuration
│       ├── neotree.lua                   # File explorer
│       ├── telescope.lua                 # Fuzzy finder
│       ├── treesitter.lua                # Syntax highlighting
│       └── ui.lua                        # UI enhancements
```

### Modular Architecture Benefits

- **Easy Plugin Addition**: Drop new `.lua` files into `lua/plugins/` and they're automatically loaded
- **Clean Separation**: Core settings separate from plugin configurations
- **Maintainable**: Each plugin has its own configuration file
- **Extensible**: Built on kickstart.nvim's solid foundation with improved organization

## 🔧 Language Servers

The following language server is configured by default:

| Language | Server | Features |
|----------|--------|----------|
| Lua | lua_ls | Neovim configuration development |

### Adding Language Servers

To add additional language servers, edit `lua/plugins/lsp.lua` and uncomment or add servers to the `servers` table:

```lua
local servers = {
  -- clangd = {},      -- C++ support
  -- pyright = {},     -- Python support  
  -- rust_analyzer = {}, -- Rust support
  lua_ls = {
    -- Already configured
  },
}
```

Popular language servers include:
- **Python**: `pyright` - Type checking, IntelliSense, imports
- **C++**: `clangd` - Completion, diagnostics, refactoring  
- **Rust**: `rust_analyzer` - Completion, diagnostics, refactoring, type hints
- **JavaScript/TypeScript**: `ts_ls` - Full language support
- **Go**: `gopls` - Go language server

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

### Adding More Language Servers
Edit `lua/plugins/lsp.lua` and add your language server to the `servers` table:

```lua
local servers = {
  lua_ls = {
    -- Already configured
  },
  pyright = {},      -- Add Python support
  clangd = {},       -- Add C++ support
  your_server = {},  -- Add your server here
}
```

### Custom Key Bindings
Add your key bindings to `lua/config/keymaps.lua`:

```lua
keymap.set("n", "<leader>xx", ":YourCommand<CR>", { desc = "Description" })
```

## 🚨 Troubleshooting

### General Issues
- **Plugins not loading**: Run `:Lazy sync` to reinstall
- **LSP not starting**: Check `:LspInfo` for server status
- **Key bindings not working**: Verify no conflicts with terminal/tmux

### Language-Specific Issues (When Added)
- **Python (pyright)**: Check that Python is in your PATH
- **Rust (rust-analyzer)**: Ensure Rust toolchain is installed via rustup
- **C++ (clangd)**: Create a `compile_commands.json` file for proper completions

## 📖 Learning Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [LSP Configuration Guide](https://github.com/neovim/nvim-lspconfig)
- [Telescope Usage](https://github.com/nvim-telescope/telescope.nvim)
- [Python Development in Neovim](https://alpha2phi.medium.com/neovim-for-beginners-python-201e1a1dd5ea)

## 🎉 Credits

This configuration is built upon the excellent foundation of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) by TJ DeVries and contributors. The modular restructuring makes it easier to maintain and customize while preserving all the great features and educational comments from the original.

## 🤝 Contributing

Feel free to submit issues and pull requests to improve this configuration!

## 📄 License

This configuration is open source and available under the [MIT License](LICENSE).
