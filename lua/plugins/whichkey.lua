return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>t", group = "TODO Comment" },
        { "<leader>f", group = "File/find" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "Git hunk" },
        { "<leader>x", group = "Trouble" },
        { "<leader>m", group = "Markdown" },
        { "<leader>y", group = "Yanking" },
        { "<leader>d", group = "Diagnostic" },
        { "<leader>l", group = "LSP" },
        { "[", group = "Prev" },
        { "]", group = "Next" },
        { "g", group = "Goto" },
        {
          "<leader>b",
          group = "Buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = "Windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
