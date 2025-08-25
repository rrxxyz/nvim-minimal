return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]h", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "Jump to next git change" })

      map("n", "[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[h", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "Jump to previous git change" })

      -- Actions
      -- visual mode
      map("v", "<leader>hs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "git stage hunk" })
      map("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "git reset hunk" })
      -- normal mode
      map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git stage hunk" })
      map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git reset hunk" })
      map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git Stage buffer" })
      map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "git undo stage hunk" })
      map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git Reset buffer" })
      map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git preview hunk" })
      map("n", "<leader>hb", gitsigns.blame_line, { desc = "git blame line" })
      map("n", "<leader>hd", gitsigns.diffthis, { desc = "git diff against index" })
      map("n", "<leader>hD", function()
        gitsigns.diffthis("@")
      end, { desc = "git [D]iff against last commit" })
      -- Toggles
      map("n", "<leader>hB", gitsigns.toggle_current_line_blame, { desc = "Toggle git show blame line" })
      map("n", "<leader>hP", gitsigns.preview_hunk_inline, { desc = "Toggle git show Deleted" })
    end,
  },
}
