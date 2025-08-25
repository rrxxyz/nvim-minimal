# Neovim Plugin Structure

This configuration is organized into **Default** (essential) and **Custom** (optional) plugins for better modularity and easy customization.

## 📁 Directory Structure

```
lua/plugins/
├── custom_config.lua      # Enable/disable custom plugins
├── init.lua              # Plugin loader system
├── default/              # Essential plugins (always loaded)
│   ├── lsp.lua           # Language Server Protocol
│   ├── completion.lua    # Code completion (blink.cmp)
│   ├── treesitter.lua    # Syntax highlighting & parsing
│   ├── telescope.lua     # Fuzzy finder
│   ├── mason.lua         # LSP/tool installer
│   ├── whichkey.lua      # Keymap helper
│   ├── colorscheme.lua   # Theme configuration
│   └── formatter.lua     # Code formatting
└── custom/               # Optional plugins (configurable)
    ├── lualine.lua       # Status line
    ├── dashboard.lua     # Start screen
    ├── gitsigns.lua      # Git integration
    ├── neogit.lua        # Advanced git interface
    ├── trouble.lua       # Diagnostics panel
    ├── todocomment.lua   # TODO highlighting
    ├── markdown.lua      # Markdown tools
    ├── grug.lua          # Search & replace
    ├── obsidian.lua      # Obsidian integration
    └── supermaven.lua    # AI completion
```

## 🔧 Default Plugins (Always Enabled)

These are **essential** plugins that provide core Neovim functionality:

- **LSP** - Language server integration for intelligent code features
- **Completion** - Code completion with blink.cmp
- **Treesitter** - Advanced syntax highlighting and code understanding
- **Telescope** - Powerful fuzzy finder for files, text, commands
- **Mason** - Automatic installation of LSP servers and tools
- **Which-key** - Interactive keymap guide
- **Colorscheme** - Theme and appearance
- **Formatter** - Code formatting with conform.nvim

## 🎨 Custom Plugins (Optional)

These plugins can be **enabled/disabled** by editing `lua/plugins/custom_config.lua`:

### UI & Appearance
- **lualine** - Beautiful status line
- **dashboard** - Customizable start screen

### Development Tools  
- **gitsigns** - Git integration with hunk management
- **neogit** - Advanced git interface
- **trouble** - Diagnostics and error panel
- **todocomment** - Highlight and navigate TODO comments

### Content & Writing
- **markdown** - Markdown preview and rendering
- **obsidian** - Obsidian vault integration

### Productivity
- **grug** - Advanced search and replace tool
- **supermaven** - AI-powered code completion

## ⚙️ How to Enable/Disable Custom Plugins

Edit `lua/plugins/custom_config.lua`:

```lua
-- 🎨 UI & APPEARANCE
M.ui = {
  lualine = true,        -- ✅ Enabled
  dashboard = false,     -- ❌ Disabled
}

-- 🔧 DEVELOPMENT TOOLS  
M.dev_tools = {
  gitsigns = true,       -- ✅ Enabled
  neogit = false,        -- ❌ Disabled  
  trouble = true,        -- ✅ Enabled
  todocomment = true,    -- ✅ Enabled
}

-- 📝 CONTENT & WRITING
M.content = {
  markdown = true,       -- ✅ Enabled
  obsidian = false,      -- ❌ Disabled
}

-- 🚀 PRODUCTIVITY
M.productivity = {
  grug = true,           -- ✅ Enabled
  supermaven = false,    -- ❌ Disabled
}
```

After making changes:
1. Save the file
2. Restart Neovim or run `:Lazy reload`
3. The changes will take effect immediately

## ➕ Adding New Custom Plugins

1. **Create the plugin file** in `lua/plugins/custom/your-plugin.lua`
2. **Add it to custom_config.lua** in the appropriate category
3. **Set it to enabled** (`= true`) 
4. **Restart Neovim**

Example:
```lua
-- In custom_config.lua
M.productivity = {
  grug = true,
  supermaven = false,
  your_new_plugin = true,  -- Add here
}
```

## 🚀 Benefits

- **Clean separation** between essential and optional functionality
- **Easy customization** without editing multiple files
- **Faster startup** - only load what you need
- **Modular** - add/remove features easily
- **Maintainable** - clear organization
- **Scalable** - easy to extend

## 🔄 Migration Notes

If you had custom configurations in the old `lua/plugins/*.lua` structure, they've been automatically moved to the appropriate directories. Your existing keymaps and configurations remain unchanged.