# Neovim Configuration for C/C++

A modern, minimal Neovim configuration focused on C/C++ and Lua development with IDE-like features.

## Features

- **Language Support**: Full LSP support for C/C++ (clangd) and Lua (lua_ls)
- **Modern Completion**: blink.cmp with snippets and auto-completion
- **Syntax Highlighting**: Tree-sitter for accurate syntax highlighting
- **File Management**: nvim-tree file explorer and Telescope fuzzy finder
- **Git Integration**: Gitsigns for git status, blame, and hunks
- **Debugging**: nvim-dap with lldb support for C/C++ debugging
- **Beautiful UI**: Tokyo Night theme with lualine and bufferline

## Requirements

- Neovim >= 0.10.0
- Git
- A C compiler (for telescope-fzf-native)
- Node.js (for some LSP servers)

### Required Tools

The configuration will automatically install these via Mason:
- `clangd` - C/C++ language server
- `lua-language-server` - Lua language server  
- `clang-format` - C/C++ formatter
- `stylua` - Lua formatter

### Optional Dependencies

For full debugging support:
- `lldb` or `gdb` - Debugger for C/C++

## Installation

1. **Backup your existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Let lazy.nvim install plugins** (this happens automatically on first run)

5. **Install LSP servers**:
   ```
   :Mason
   ```
   Or they'll be installed automatically when you open relevant files.

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

### Debugging
| Key | Action |
|-----|--------|
| `<Space>db` | Toggle breakpoint |
| `<Space>dc` | Continue |
| `<Space>di` | Step into |
| `<Space>do` | Step out |
| `<Space>dO` | Step over |
| `<Space>du` | Toggle DAP UI |

### Buffer Management
| Key | Action |
|-----|--------|
| `<Space>bd` | Delete buffer |
| `<Space>bb` | Switch to other buffer |
| `<Space>bp` | Toggle pin buffer |

## Customization

### Adding Languages

To add support for additional languages:

1. Add the language server to `lua/plugins/lsp.lua`:
   ```lua
   ensure_installed = { "lua_ls", "clangd", "your_language_server" }
   ```

2. Add Treesitter support in `lua/plugins/editor.lua`:
   ```lua
   ensure_installed = { "c", "cpp", "lua", "your_language" }
   ```

### Changing Theme

Edit `lua/plugins/ui.lua` and replace the colorscheme:
```lua
{
  "your-preferred/theme.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("your-theme")
  end,
}
```

### Modifying Keybindings

Edit `lua/config/keymaps.lua` to customize key mappings.

## Troubleshooting

### LSP Not Working

1. Check LSP status: `:LspInfo`
2. Check Mason installations: `:Mason`
3. Check logs: `:LspLog`

### Performance Issues

1. Check startup time: `nvim --startuptime startup.log`
2. Profile plugins: `:Lazy profile`

### Completion Not Working

1. Check blink.cmp status: `:lua print(vim.inspect(require('blink.cmp').get_lsp_capabilities()))`
2. Restart LSP: `:LspRestart`

## C/C++ Project Setup

### For C/C++ projects, create a `.clangd` file in your project root:

```yaml
CompileFlags:
  Add: [-I/path/to/your/includes]
  Remove: [-W*]
```

### Or use `compile_commands.json`:

```bash
# For CMake projects
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .

# For Make projects  
bear -- make
```

## Contributing

Feel free to submit issues and enhancement requests!

## License

This configuration is available under the MIT license.
