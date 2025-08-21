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
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep search |
| `<leader>fb` | Browse buffers |
| `<leader>fh` | Help tags |
| `<leader>fn` | Neovim config files |

### Code Formatting
| Key | Action |
|-----|--------|
| `<leader>cf` | Format file or selection |

### LSP Commands (When LSP is attached)
| Key | Action |
|-----|--------|
| `gD` | Go to declaration |
| `gd` | Go to definition (Telescope) |
| `gi` | Go to implementation (Telescope) |
| `gr` | Find references (Telescope) |
| `gR` | Rename symbol |
| `gt` | Go to type definition (Telescope) |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `<leader>ca` | Code actions |
| `<leader>d` | Show diagnostic float |
| `[d` / `]d` | Previous/next diagnostic |
| `<leader>lr` | Restart LSP server |
| `K` | Hover documentation |

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
│       ├── formatter.lua                 # Code formatting with conform.nvim
│       ├── lsp.lua                       # LSP configuration
│       ├── telescope.lua                 # Fuzzy finder
│       ├── treesitter.lua                # Syntax highlighting
│       ├── mason.lua                     # LSP server management
│       ├── lualine.lua                   # Status line
│       ├── gitsign.lua                   # Git integration
│       ├── trouble.lua                   # Diagnostics list
│       ├── neogit.lua                    # Git interface
│       ├── supermaven.lua                # AI completion
│       ├── obsidian.lua                  # Note-taking
│       ├── dashboard.lua                 # Start screen
│       ├── whichkey.lua                  # Key mapping help
│       ├── todocomment.lua               # TODO highlighting
│       ├── markdown.lua                  # Markdown support
│       └── grug.lua                      # Search and replace
```

### Modular Architecture Benefits

- **Easy Plugin Addition**: Drop new `.lua` files into `lua/plugins/` and they're automatically loaded
- **Clean Separation**: Core settings separate from plugin configurations
- **Maintainable**: Each plugin has its own configuration file
- **Extensible**: Built on kickstart.nvim's solid foundation with improved organization

## 🔧 Language Servers

The following language servers are configured by default:

| Language | Server | Features |
|----------|--------|----------|
| Lua | lua_ls | Neovim configuration development, completion, diagnostics |

### Language Server Configuration

Language servers are pre-configured in `lua/plugins/lsp.lua`. The current setup includes:

```lua
local servers = {
  lua_ls = {},
  -- pyright = {},
  -- rust_analyzer = {
  --   settings = {
  --     ["rust-analyzer"] = {
  --       cargo = { allFeatures = true }
  --     }
  --   }
  -- },
  -- clangd = {}
}
```

### Adding More Language Servers

To add additional language servers, edit `lua/plugins/lsp.lua` and add servers to the `servers` table:

```lua
local servers = {
  lua_ls = {},
  -- Uncomment and configure additional servers as needed:
  -- pyright = {},      -- Python
  -- rust_analyzer = { --[[ config ]] }, -- Rust
  -- clangd = {},       -- C++
  -- ts_ls = {},        -- JavaScript/TypeScript
  -- gopls = {},        -- Go
  -- bashls = {},       -- Bash
}
```

Install language servers using Mason: `:Mason`

## ✨ Features

### Core Features
- **📦 Modular Architecture**: Easy to extend and customize
- **🚀 Fast Startup**: Optimized plugin loading with lazy.nvim
- **🎯 LSP Ready**: Multiple language servers pre-configured
- **🔍 Powerful Search**: Telescope for fuzzy finding everything
- **🎨 Beautiful UI**: Custom status line, icons, and themes
- **🔧 Auto-formatting**: Format on save with conform.nvim
- **📝 Smart Completion**: Advanced autocompletion with blink.cmp
- **🌳 Syntax Highlighting**: Tree-sitter for accurate highlighting
- **🔗 Git Integration**: Built-in git signs and Neogit interface
- **🧠 AI Assistance**: Supermaven AI completion support
- **📓 Note Taking**: Obsidian.nvim integration
- **🚨 Diagnostics**: Trouble for organized error/warning lists

### Language Support
- **Lua**: Full development environment for Neovim configuration
- Additional language servers can be easily enabled by uncommenting them in the configuration

## 📚 Plugin Management

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

### Common Commands
- `:Lazy` - Open plugin manager UI
- `:Lazy update` - Update all plugins  
- `:Lazy clean` - Remove unused plugins
- `:Lazy sync` - Sync all plugins
- `:Mason` - Manage LSP servers, formatters, and linters
- `:LspInfo` - Check LSP server status
- `:ConformInfo` - Check formatter status

## 🛠️ Customization

### Custom Key Bindings
Add your key bindings to `lua/config/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>xx", ":YourCommand<CR>", { desc = "Description" })
```

### Code Formatting
Formatters are configured in `lua/plugins/formatter.lua`:

```lua
formatters_by_ft = {
  lua = { "stylua" },
  -- python = { "isort", "black" },
  -- rust = { "rustfmt", lsp_format = "fallback" },
  -- cpp = { "clang-format" }
}
```

## 🚨 Troubleshooting

### General Issues
- **Plugins not loading**: Run `:Lazy sync` to reinstall
- **LSP not starting**: Check `:LspInfo` for server status
- **Key bindings not working**: Verify no conflicts with terminal/tmux

### Language-Specific Issues (When Enabled)
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
