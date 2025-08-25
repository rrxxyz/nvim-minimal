# Neovim Keymap Reference

## Leader Key
- **Leader**: `<Space>`

## Core Keymaps (lua/config/keymaps.lua)

### File Management
- `<leader>e` - Back to file manager (vim.cmd.Ex)

### Buffer Management
- `]b` - Go to next buffer
- `[b` - Go to previous buffer
- `<leader>bx` - Delete current buffer

### Text Movement & Editing
- `J` (Visual) - Move selected line down
- `K` (Visual) - Move selected line up
- `<leader>p` (Visual) - Paste and keep the copy
- `Q` - Disabled (no operation)

### Clipboard & Yanking
- `<leader>y` (Normal/Visual) - Better yank (to system clipboard)
- `<leader>Y` (Normal) - Better yank line (to system clipboard)
- `<C-a>` - Select all text (ggVG)
- `<C-y>` - Yank all text to clipboard

### Navigation
- `<C-d>` - Jump half page down (with cursor centering)
- `<C-u>` - Jump half page up (with cursor centering)
- `<C-h>` - Move focus to left window
- `<C-l>` - Move focus to right window
- `<C-j>` - Move focus to lower window
- `<C-k>` - Move focus to upper window

### Search & Replace
- `<Esc>` - Clear search highlight
- `rr` - Replace all (opens :%s/)

### Terminal
- `<Esc><Esc>` (Terminal mode) - Exit terminal mode
- `<leader>tt` - Toggle horizontal terminal

## Plugin Keymaps

### Telescope (lua/plugins/telescope.lua)
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Buffers
- `<leader>fh` - Help tags
- `<leader>fn` - Find Neovim files

### LSP (lua/plugins/lsp.lua)
- `gD` - Go to declaration
- `gd` - Go to definition (Telescope)
- `gi` - Go to implementation (Telescope)
- `gr` - Show references (Telescope)
- `gt` - Go to type definition (Telescope)
- `gR` - Rename symbol
- `K` - Show hover information
- `<leader>ca` - Code actions
- `<leader>d` - Show diagnostics in float
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>lr` - LSP restart

### Git (GitSigns - lua/plugins/gitsign.lua)
- `]h` - Next git hunk
- `[h` - Previous git hunk
- `<leader>hs` - Stage hunk (Normal/Visual)
- `<leader>hr` - Reset hunk (Normal/Visual)
- `<leader>hS` - Stage buffer
- `<leader>hu` - Undo stage hunk
- `<leader>hR` - Reset buffer
- `<leader>hp` - Preview hunk
- `<leader>hb` - Git blame line
- `<leader>hd` - Git diff against index
- `<leader>hD` - Git diff against last commit
- `<leader>hB` - Toggle current line blame
- `<leader>hP` - Preview hunk inline

### Neogit (lua/plugins/neogit.lua)
- `<leader>go` - Open Neogit status buffer
- `<leader>gd` - Use different repository path
- `<leader>gf` - Use repository of current file
- `<leader>gp` - Open specified popup directly
- `<leader>gc` - Open commit popup

### Trouble (lua/plugins/trouble.lua)
- `<leader>xx` - Toggle diagnostics (Trouble)
- `<leader>xX` - Toggle buffer diagnostics (Trouble)
- `<leader>xs` - Toggle symbols (Trouble)
- `<leader>xS` - Toggle LSP references/definitions (Trouble)
- `<leader>xL` - Toggle location list (Trouble)
- `<leader>xQ` - Toggle quickfix list (Trouble)
- `[q` - Previous Trouble/Quickfix item
- `]q` - Next Trouble/Quickfix item

### Todo Comments (lua/plugins/todocomment.lua)
- `]t` - Next todo comment
- `[t` - Previous todo comment
- `<leader>tx` - Todo (Trouble)
- `<leader>tX` - Todo/Fix/Fixme (Trouble)
- `<leader>ts` - Todo (Telescope)
- `<leader>tS` - Todo/Fix/Fixme (Telescope)

### Formatter (lua/plugins/formatter.lua)
- `<leader>cf` - Format file (Normal/Visual)

### Search & Replace - Grug Far (lua/plugins/grug.lua)
- `<leader>fr` - Search and replace (Normal/Visual)

### Markdown (lua/plugins/markdown.lua)
- `<leader>mr` - Render markdown
- `<leader>mp` - Markdown preview start
- `<leader>ms` - Markdown preview stop
- `<C-s>` - Markdown preview (when in markdown files)
- `<M-s>` - Markdown preview stop (when in markdown files)
- `<C-p>` - Markdown preview toggle (when in markdown files)

### Which-Key (lua/plugins/whichkey.lua)
- `<leader>?` - Show buffer local keymaps

## Which-Key Groups
- `<leader>t` - Terminal/TODO Comment
- `<leader>f` - File/find
- `<leader>g` - Git
- `<leader>h` - Git hunk
- `<leader>x` - Trouble
- `<leader>m` - Markdown
- `<leader>y` - Yanking
- `<leader>d` - Diagnostic
- `<leader>l` - LSP
- `<leader>b` - Buffer
- `<leader>w` - Windows
- `[` - Previous
- `]` - Next
- `g` - Goto

## Potential Conflicts & Notes

### ✅ VERIFIED STATUS:

1. **`<leader>hu` - Previously reported conflict:**
   - GitSigns: "Undo stage hunk" 
   - **STATUS**: ✅ RESOLVED - Correctly mapped to `gitsigns.undo_stage_hunk` on line 58 in gitsign.lua

2. **`K` key usage:**
   - Core keymaps (Visual mode): Move selected line up
   - LSP (Normal mode): Show hover information
   - **STATUS**: No conflict - different modes

3. **Disabled keymaps:**
   - `]q`, `[q` commented out in keymaps.lua (line 12-13) in favor of Trouble

### ⚠️  POTENTIAL ISSUES:

1. **Markdown plugin keymaps** (`<C-s>`, `<M-s>`, `<C-p>`) are set globally but should only work in markdown files
2. **`<C-k>` window navigation** may conflict with completion popup navigation in some contexts

### 🎯 RECOMMENDATIONS:

1. Fix the GitSigns undo stage hunk mapping
2. Consider making markdown keymaps filetype-specific
3. Add more descriptive comments for complex keymaps
4. Consider grouping related keymaps closer together