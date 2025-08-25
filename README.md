# nvim-minimal: Modular Neovim Configuration

A highly modular Neovim configuration forked from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

This configuration features a **two-tier plugin system** that separates essential from optional functionality:
- **🔧 Default Plugins**: Essential tools (LSP, completion, telescope) always loaded
- **🎨 Custom Plugins**: Optional features you can easily enable/disable
- **⚡ Smart Loading**: Only load what you need for faster startup
- **🎛️ Easy Management**: Toggle plugins with simple commands
- **📚 Well-Documented**: Clear structure with comprehensive guides

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
   - Linux/Mac
      ```bash
       git clone https://github.com/rizkirakasiwi/nvim-minimal.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
      ```
   - Windows
      Using `cmd.exe`
      ```bash
      git clone https://github.com/rizkirakasiwi/nvim-minimal.git "%localappdata%\nvim"
      ```
      Using `powershell.exe`
     ```bash
     git clone https://github.com/rizkirakasiwi/nvim-minimal.git "${env:LOCALAPPDATA}\nvim"
     ```
   

4. Start Neovim - plugins will install automatically:
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
| `<leader>tt`  | Open/close terminal |

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
├── doc/                                  # 📚 Documentation
│   ├── PLUGIN_STRUCTURE.md               # 📖 Complete plugin management guide
│   └── KEYMAPS.md                        # 🗝️ All keymaps reference
├── lua/
│   ├── config/                           # Core Neovim configuration
│   │   ├── autocmds.lua                  # Autocommands & plugin commands
│   │   ├── keymaps.lua                   # Global key mappings
│   │   ├── lazy.lua                      # Bootstrap lazy.nvim
│   │   └── options.lua                   # Neovim settings & options
│   ├── commands/                         # Custom commands
│   │   └── plugin_manager.lua            # Plugin management utilities
│   └── plugins/                          # 🔧 Two-tier plugin system
│       ├── custom_config.lua             # 🎛️ Enable/disable custom plugins
│       ├── init.lua                      # Plugin loader system
│       ├── default/                      # 📌 Essential plugins (always loaded)
│       │   ├── lsp.lua                   # Language Server Protocol
│       │   ├── completion.lua            # Code completion (blink.cmp)
│       │   ├── treesitter.lua            # Syntax highlighting
│       │   ├── telescope.lua             # Fuzzy finder
│       │   ├── mason.lua                 # LSP/tool installer
│       │   ├── whichkey.lua              # Keymap helper
│       │   ├── colorscheme.lua           # Theme configuration
│       │   └── formatter.lua             # Code formatting
│       └── custom/                       # 🎨 Optional plugins (configurable)
│           ├── lualine.lua               # Status line
│           ├── gitsign.lua               # Git integration
│           ├── trouble.lua               # Diagnostics panel
│           ├── neogit.lua                # Advanced git interface
│           ├── dashboard.lua             # Start screen
│           ├── todocomment.lua           # TODO highlighting
│           ├── markdown.lua              # Markdown tools
│           ├── grug.lua                  # Search & replace
│           ├── obsidian.lua              # Note-taking integration
│           └── supermaven.lua            # AI completion
```

### 🚀 Two-Tier Plugin Architecture

- **📌 Default Plugins**: Core functionality (LSP, completion, telescope) always available
- **🎨 Custom Plugins**: Optional features you can toggle on/off
- **🎛️ Easy Management**: Use `:PluginStatus`, `:PluginConfig`, and simple true/false switches
- **⚡ Performance**: Only load what you need for faster startup
- **📚 Self-Documenting**: Built-in commands and comprehensive documentation

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

This configuration features a **two-tier plugin system** with easy enable/disable functionality.

### 🎛️ Custom Plugin Management Commands
- `:PluginStatus` - View all plugins and their current status
- `:PluginConfig` - Edit plugin configuration file  
- `:PluginToggle <category> <plugin>` - Toggle specific plugins

### 📖 Complete Plugin Guide
For detailed instructions on managing plugins, adding new ones, and understanding the architecture, see **[doc/PLUGIN_STRUCTURE.md](doc/PLUGIN_STRUCTURE.md)**.

### 🔧 System Commands  
- `:Lazy` - Open plugin manager UI
- `:Lazy update` - Update all plugins  
- `:Lazy clean` - Remove unused plugins
- `:Lazy sync` - Sync all plugins
- `:Mason` - Manage LSP servers, formatters, and linters
- `:LspInfo` - Check LSP server status
- `:ConformInfo` - Check formatter status

### Quick Start: Enable/Disable Features
1. Run `:PluginConfig` to open the configuration file
2. Change `true` to `false` (or vice versa) for any custom plugin
3. Restart Neovim or run `:Lazy reload`
4. Changes take effect immediately

Example:
```lua
-- 🎨 UI & APPEARANCE
M.ui = {
  lualine = true,        -- ✅ Status line enabled
  dashboard = false,     -- ❌ Start screen disabled
}
```

## 🛠️ Customization

### 📖 Comprehensive Guides
- **[doc/PLUGIN_STRUCTURE.md](doc/PLUGIN_STRUCTURE.md)** - Complete plugin management guide
- **[doc/KEYMAPS.md](doc/KEYMAPS.md)** - All keymaps organized by plugin

### Adding Your Own Custom Plugins
1. **Create plugin file** in `lua/plugins/custom/your-plugin.lua`
2. **Add to configuration** in `lua/plugins/custom_config.lua`:
   ```lua
   M.your_category = {
     your_plugin = true,  -- Enable your new plugin
   }
   ```
3. **Restart Neovim** and your plugin loads automatically

See [doc/PLUGIN_STRUCTURE.md](doc/PLUGIN_STRUCTURE.md) for detailed instructions and examples.

### Custom Key Bindings
Add your key bindings to `lua/config/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>xx", ":YourCommand<CR>", { desc = "Description" })
```

### Code Formatting
Formatters are configured in `lua/plugins/default/formatter.lua`:

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
