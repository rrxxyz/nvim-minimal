return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = { blink = { enabled = true } },
      preset = "obsidian",
    },
    keys = {
      { "<leader>mr", ":RenderMarkdown<CR>", desc = "Render Markdown" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npx --yes yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      { "<leader>mp", ":MarkdownPreview<CR>", desc = "Markdown preview start" },
      { "<leader>ms", ":MarkdownPreviewStop", desc = "Markdown preview stop" },
    },
    config = function()
      -- Set Edge as the browser
      vim.g.mkdp_browser = "msedge"

      -- Basic configuration
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_theme = "dark" -- or 'light'
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_page_title = "「${name}」"

      -- Key mappings
      vim.keymap.set("n", "<C-s>", "<Plug>MarkdownPreview", { desc = "Markdown Preview" })
      vim.keymap.set("n", "<M-s>", "<Plug>MarkdownPreviewStop", { desc = "Markdown Preview Stop" })
      vim.keymap.set("n", "<C-p>", "<Plug>MarkdownPreviewToggle", { desc = "Markdown Preview Toggle" })
    end,
  },
}
