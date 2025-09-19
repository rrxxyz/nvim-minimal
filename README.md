# 🤖 Android Development with Neovim

**A complete Android development environment built on a modular Neovim configuration.**

This is the **android-nvim** branch - a specialized Android development setup that extends our language-agnostic starter kit foundation. Get a fully-featured Android development environment with Kotlin LSP, Gradle integration, logcat viewing, and comprehensive debugging tools.

## 🎯 Why Choose This Android Development Setup?

- **🤖 Complete Android Toolkit** - Kotlin LSP, Gradle integration, logcat viewing, and debugging
- **🚀 Production Ready** - Everything you need for professional Android development
- **🌳 Branch-Based Architecture** - Switch between different language configurations with NeoChange
- **📚 Educational by Design** - Learn modern Neovim patterns and Android development best practices
- **⚡ Optimized Performance** - Fast startup with lazy-loaded plugins and efficient Android tooling

## 🌳 Branch Architecture & NeoChange Integration

This repository uses a powerful branch-based approach that lets you switch between different programming language configurations seamlessly:

### Available Starter Configurations:

- **`main`** - 🟢 **Pure Starter Base** - Lua-optimized foundation
- **`android-nvim`** - 🤖 **Android Development** - Complete Android development environment (Current Branch)
- **`ccpp-nvim`** - 🔷 **C/C++ Development** - Complete C/C++ development environment
- **More coming soon!** - Community contributions for Python, Go, Rust, JavaScript, etc.

### 🔄 Easy Branch Switching with NeoChange

**NEW!** You can now switch between different language configurations instantly using **NeoChange**:

```vim
" Switch to Android development environment (current)
:NeoChange android-nvim

" Switch to C/C++ development environment
:NeoChange ccpp-nvim

" Switch back to minimal Lua base
:NeoChange main

" NeoChange will automatically:
" - Switch git branches
" - Restart Neovim with new configuration
" - Handle plugin management seamlessly
```

_No more manual git commands or configuration headaches!_

### Current Branch: android-nvim (Android Development)

This branch provides a complete Android development environment with:

- **Kotlin Language Server** - Full LSP support for Kotlin development
- **Android Integration** - Build, run, and debug Android projects directly from Neovim
- **Gradle Support** - Execute Gradle tasks with integrated output viewing
- **Logcat Viewer** - Real-time Android logging with filtering capabilities
- **XML/Manifest Support** - Language server and formatting for Android XML files
- **Debugging Tools** - Full DAP integration for Android debugging

## What's Included

### Core Features

- **Plugin Management**: lazy.nvim for fast, lazy-loaded plugins
- **Android Development**: droid-nvim for complete Android project integration
- **Kotlin LSP**: Full language server support with kotlin-language-server
- **Gradle Integration**: Execute and monitor Gradle tasks directly from Neovim
- **Logcat Viewer**: Real-time Android device logging with advanced filtering
- **XML Support**: Language server (lemminx) and formatting for Android manifests/layouts
- **TOML Support**: Configuration file support with taplo for Gradle version catalogs
- **Completion**: blink.cmp for modern completion experience with Kotlin support
- **Syntax Highlighting**: Tree-sitter for accurate Kotlin, Java, and XML highlighting
- **File Navigation**: Telescope for fuzzy finding across Android project structure
- **Git Integration**: Git signs and navigation optimized for Android development workflow
- **Debugging**: nvim-dap integration for Android debugging
- **Modern UI**: Clean theme with statusline showing build status

### What Makes This Different

- **Android-Focused** - Every tool specifically chosen for Android development workflow
- **IDE-like Experience** - Build, run, debug, and monitor Android apps without leaving Neovim
- **Performance Optimized** - Fast startup even with comprehensive Android tooling
- **Well-documented** - Every configuration choice is clear and commented
- **Professional Ready** - Used for real Android development projects
- **Educational** - Learn modern Android development patterns alongside Neovim mastery

## Requirements

### Essential Requirements

- **Neovim >= 0.10.0** - Modern Neovim with latest features
- **Git** - Version control and plugin management
- **Java Development Kit (JDK) 17+** - Required for Android development and Kotlin LSP
- **Android SDK** - Android development tools and platform APIs
- **Android SDK Command-line Tools** - adb, aapt, and other CLI tools
- **Gradle** - Build system for Android projects
- **A C compiler** - For compiling telescope-fzf-native

### Optional but Recommended

- **Android Emulator** - For testing apps directly from Neovim
- **Android device with USB debugging** - For real device testing and logcat
- **Kotlin** - For standalone Kotlin development (included with Android SDK)

### Android Development Tools (Auto-installed by Mason)

Mason will automatically install these language servers and tools:

- **`kotlin-language-server`** - Kotlin LSP for code completion, navigation, and diagnostics
- **`gradle-language-server`** - Gradle build script support and completion
- **`lemminx`** - XML language server for Android manifests and layouts
- **`xmlformatter`** - XML formatting for clean Android resource files
- **`taplo`** - TOML language server for Gradle version catalogs
- **`ktlint`** - Kotlin code formatting and style checking
- **`lua-language-server`** - For Neovim configuration editing
- **`stylua`** - Lua code formatting

_All Android development tools are automatically configured for immediate productivity._

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

3. **Switch to Android development branch**:

    ```bash
    cd ~/.config/nvim
    git checkout android-nvim  # For Android development setup
    ```

4. **Start Neovim**:

    ```bash
    nvim
    ```

5. **Let lazy.nvim install plugins** (this happens automatically on first run)

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
│       ├── lsp.lua            # LSP configuration (Kotlin, Gradle, XML, TOML)
│       ├── completion.lua     # Completion engine
│       ├── editor.lua         # Core editing plugins
│       ├── ui.lua             # UI enhancements
│       ├── debug.lua          # Debugging support
│       ├── droid.lua          # Android development integration
│       └── neochange.lua      # Branch switching plugin
├── CLAUDE.md                   # Claude Code instructions
├── lazy-lock.json              # Plugin version lock file
└── README.md                   # This file
```

## Key Bindings

### General

| Key       | Action                 |
| --------- | ---------------------- |
| `<Space>` | Leader key             |
| `<C-s>`   | Save file              |
| `<Esc>`   | Clear search highlight |

### Navigation

| Key                      | Action           |
| ------------------------ | ---------------- |
| `<C-h/j/k/l>`            | Navigate windows |
| `<S-h/l>`                | Navigate buffers |
| `<C-Up/Down/Left/Right>` | Resize windows   |

### File Management

| Key         | Action                |
| ----------- | --------------------- |
| `<Space>e`  | Toggle file explorer  |
| `<Space>ff` | Find files            |
| `<Space>fg` | Find text (live grep) |
| `<Space>fb` | Find buffers          |
| `<Space>fr` | Recent files          |

### LSP

| Key         | Action                |
| ----------- | --------------------- |
| `gd`        | Go to definition      |
| `gD`        | Go to declaration     |
| `gr`        | Find references       |
| `gI`        | Go to implementation  |
| `gt`        | Go to type definition |
| `K`         | Hover documentation   |
| `<Space>ca` | Code actions          |
| `<Space>cr` | Rename                |
| `<Space>cf` | Format                |

### Diagnostics

| Key         | Action                |
| ----------- | --------------------- |
| `]d`        | Next diagnostic       |
| `[d`        | Previous diagnostic   |
| `<Space>cd` | Document diagnostics  |
| `<Space>cD` | Workspace diagnostics |
| `<Space>xx` | Toggle Trouble        |

### Git

| Key          | Action            |
| ------------ | ----------------- |
| `]h`         | Next git hunk     |
| `[h`         | Previous git hunk |
| `<Space>ghs` | Stage hunk        |
| `<Space>ghr` | Reset hunk        |
| `<Space>ghp` | Preview hunk      |
| `<Space>ghb` | Blame line        |

### Buffer Management

| Key         | Action                 |
| ----------- | ---------------------- |
| `<Space>bd` | Delete buffer          |
| `<Space>bb` | Switch to other buffer |
| `<Space>bp` | Toggle pin buffer      |

### Android Development

| Key          | Action                               |
| ------------ | ------------------------------------ |
| `<leader>ar` | Build and run Android project        |
| `<leader>ac` | Clean Android project                |
| `<leader>as` | Sync Gradle dependencies             |
| `<leader>at` | Run custom Gradle task (interactive) |
| `<leader>al` | Show logcat output                   |
| `<leader>aL` | Stop logcat                          |
| `<leader>aA` | Toggle logcat auto-scroll            |
| `<leader>ag` | Show Gradle build log                |
| `<leader>aG` | Stop Gradle process                  |
| `<leader>aE` | Stop Android emulator                |
| `<leader>aW` | Wipe emulator data                   |

### Logcat Filtering

| Key          | Action                             |
| ------------ | ---------------------------------- |
| `<leader>lf` | Custom logcat filter (interactive) |
| `<leader>lm` | Filter to show only my package     |
| `<leader>ln` | Show all logs (no package filter)  |
| `<leader>le` | Filter to show errors only         |
| `<leader>lw` | Filter to show warnings and above  |

## Android Development Workflow

### Quick Start Guide

1. **Open an Android project**: `cd your-android-project && nvim`
2. **Build and run**: Press `<leader>ar` to build and run your app
3. **View logs**: Press `<leader>al` to open logcat and monitor your app
4. **Code with LSP**: Get full Kotlin completion, navigation, and diagnostics
5. **Debug**: Set breakpoints and use integrated debugging tools

### Typical Development Session

```bash
# Navigate to your Android project
cd ~/AndroidStudioProjects/MyApp

# Open in Neovim
nvim

# In Neovim:
# 1. Edit your Kotlin files with full LSP support
# 2. <leader>ar - Build and run the app
# 3. <leader>al - Monitor logcat output
# 4. <leader>lm - Filter logs to your package only
# 5. Make changes and repeat
```

### Project Setup Requirements

- **Gradle project** with `build.gradle.kts` or `build.gradle`
- **Android manifest** at `app/src/main/AndroidManifest.xml`
- **Source code** in standard Android project structure
- **Connected device** or running emulator for deployment

### Advanced Workflows

- **Custom Gradle tasks**: `<leader>at` → Enter task name (e.g., `assembleDebug`, `test`)
- **Log filtering**: Use various `<leader>l*` commands for targeted debugging
- **Emulator management**: `<leader>aE` to stop, `<leader>aW` to wipe data
- **Multi-module projects**: LSP automatically handles module dependencies

## Getting Started

### For Android Developers

1. **Ensure Android SDK is installed** and `ANDROID_HOME` is set
2. **Open any Android project** in Neovim to trigger plugin loading
3. **Connect a device or start emulator** for testing
4. **Use `<leader>ar`** to build and run your first app
5. **Explore logcat filtering** with `<leader>l*` commands

### For Customization

- **Add Android tools**: Extend `lua/plugins/droid.lua` configuration
- **Modify Kotlin LSP**: Update `lua/plugins/lsp.lua` servers section
- **Change theme**: Modify `lua/plugins/ui.lua`
- **Add plugins**: Create new files in `lua/plugins/`
- **Modify keybinds**: Edit `lua/config/keymaps.lua` or plugin-specific configs

## Example Branches

### android-nvim Branch (Current)

Complete Android development environment featuring:

- **Kotlin Language Server** - Full LSP support with intelligent completion
- **droid-nvim Integration** - Build, run, and debug Android projects
- **Gradle Language Server** - Build script support and task execution
- **XML/TOML Support** - Language servers for Android manifests and configurations
- **Logcat Integration** - Real-time device logging with advanced filtering
- **Debugging Tools** - Full DAP integration for Android debugging

### main Branch

Minimal foundation that this branch extends:

- Essential plugins for modern editing
- Lua language server and basic tooling
- Clean, educational codebase structure
- Foundation for any language-specific extension

### Your Own Android Extension

Consider creating your own branch for specialized Android needs:

```bash
git checkout android-nvim
git checkout -b my-android-config
# Add your Android-specific customizations
# For example: Flutter support, React Native tools, etc.
git add -A && git commit -m "My specialized Android config"
```

## 🔄 Switching Between Configurations

### Method 1: Using NeoChange (Recommended)

```vim
:NeoChange android-nvim  " Switch to Android development (current)
:NeoChange ccpp-nvim     " Switch to C/C++ configuration
:NeoChange main          " Switch to base configuration
```

### Method 2: Manual Git Commands

```bash
# Switch to Android development configuration (current)
git checkout android-nvim

# Switch to C/C++ + Lua configuration
git checkout ccpp-nvim

# Switch back to base Lua configuration
git checkout main

# After switching, restart Neovim to reload configuration
```

**Pro Tip:** Use NeoChange for seamless switching - it handles everything automatically!

## Customization Guide

### Philosophy: Start Small, Add What You Need

This configuration is intentionally minimal. Instead of removing features you don't want, you add only what you need.

### Common Customizations

#### Adding More Android Tools

1. **Add language server** in `lua/plugins/lsp.lua`:

    ```lua
    ensure_installed = {
      "kotlin-language-server",
      "gradle-language-server",
      "lemminx",
      "java-language-server", -- Add for Java support
    }
    ```

2. **Add server configuration**:

    ```lua
    servers = {
      kotlin_language_server = {},
      gradle_ls = {},
      jdtls = {}, -- Add Java LSP configuration
    }
    ```

3. **Add treesitter parsers** in `lua/plugins/editor.lua`:

    ```lua
    ensure_installed = {
      "kotlin",
      "java",
      "xml",
      "groovy", -- Add for Gradle build scripts
    }
    ```

4. **Add formatters** in conform.nvim configuration:
    ```lua
    formatters_by_ft = {
      kotlin = { "ktlint" },
      java = { "google-java-format" }, -- Add this
    }
    ```

#### Adding More Android Plugins

Create a new file like `lua/plugins/my-android-additions.lua`:

```lua
return {
  -- Example: Flutter support
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui
    },
    config = true,
  },

  -- Example: React Native support
  {
    "microsoft/vscode-react-native",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  },
}
```

### Learning Resources

- **Explore the main branch** to understand the foundational architecture
- **Check droid-nvim documentation** for advanced Android integration features
- **Read Kotlin LSP docs** for optimizing language server performance
- **Study the plugin configurations** in `lua/plugins/` to understand lazy.nvim patterns
- **Android Developer Documentation** for understanding the build and deployment workflow

## Troubleshooting

### Android Development Issues

#### Kotlin LSP Not Working

1. **Check LSP status**: `:LspInfo` (should show kotlin_language_server)
2. **Verify Java installation**: `java --version` (requires JDK 17+)
3. **Check Mason installations**: `:Mason` (ensure kotlin-language-server is installed)
4. **Restart LSP**: `:LspRestart kotlin_language_server`
5. **Check project structure**: Ensure you're in a valid Gradle project

#### Android Build/Run Issues

1. **Verify Android SDK**: Check `ANDROID_HOME` environment variable is set
2. **Check device connection**: `adb devices` should show your device/emulator
3. **Gradle sync issues**: Try `<leader>as` to sync dependencies
4. **Permission issues**: Ensure adb has proper permissions
5. **Project not recognized**: Ensure `build.gradle` or `build.gradle.kts` exists

#### Logcat Problems

1. **No logcat output**:
    - Check device connection: `adb devices`
    - Try `<leader>aL` then `<leader>al` to restart logcat
    - Ensure app is running on the device
2. **Too many logs**: Use filtering commands (`<leader>lm`, `<leader>le`, etc.)
3. **Logcat freezing**: Toggle auto-scroll with `<leader>aA`

#### Gradle Integration Issues

1. **Gradle tasks not found**: Ensure you're in project root with `build.gradle`
2. **Build errors**: Check `<leader>ag` for detailed Gradle output
3. **Slow builds**: Consider using Gradle daemon and build cache
4. **Version conflicts**: Check Gradle wrapper version matches project requirements

### General LSP Issues

1. **Check LSP status**: `:LspInfo`
2. **Check Mason installations**: `:Mason`
3. **Check logs**: `:LspLog`
4. **Restart all LSP**: `:LspRestart`

### Performance Issues

1. **Check startup time**: `nvim --startuptime startup.log`
2. **Profile plugins**: `:Lazy profile`
3. **Android-specific**: Large projects may need increased LSP memory

### Completion Not Working

1. **Check blink.cmp capabilities**: `:lua print(vim.inspect(require('blink.cmp').get_lsp_capabilities()))`
2. **Restart LSP**: `:LspRestart`
3. **Kotlin-specific**: Ensure project has been indexed by the language server

### XML/Manifest Issues

1. **No XML completion**: Check if lemminx is running in `:LspInfo`
2. **Formatting problems**: Ensure xmlformatter is installed via Mason
3. **Android-specific XML**: Ensure you're in an Android project for context

### Branch-Specific Issues

- **Ensure correct branch**: `git branch` should show `android-nvim`
- **After switching branches**: Restart Neovim completely
- **Missing Android tools**: Run `:Mason` and install missing servers

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
- 🦋 **Flutter** (`flutter-nvim` branch) - Cross-platform mobile development
- ⚛️ **React Native** (`react-native-nvim` branch) - Mobile development with React
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

# Or extend the Android branch for mobile development
git checkout android-nvim
git checkout -b flutter-nvim  # for Flutter development

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
