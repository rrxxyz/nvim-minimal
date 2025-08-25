return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 300, -- Show popup after 300ms instead of default 1000ms
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        -- Core groups with clear descriptions
        { "<leader>b", group = "󰓩 Buffer Management", icon = "󰓩" },
        { "<leader>c", group = "󰘦 Code Actions", icon = "󰘦" },
        { "<leader>d", group = "󰒡 Diagnostics", icon = "󰒡" },
        { "<leader>f", group = "󰈞 Find/Files", icon = "󰈞" },
        { "<leader>g", group = "󰊢 Git Operations", icon = "󰊢" },
        { "<leader>h", group = "󰊢 Git Hunks", icon = "󰊢" },
        { "<leader>l", group = "󰌘 LSP Functions", icon = "󰌘" },
        { "<leader>m", group = "󰍔 Markdown", icon = "󰍔" },
        { "<leader>t", group = "󰄬 Terminal/TODO", icon = "󰄬" },
        { "<leader>x", group = "󰔫 Trouble/Debug", icon = "󰔫" },
        { "<leader>y", group = "󰅌 Yank/Clipboard", icon = "󰅌" },

        -- Navigation groups
        { "[", group = "󰒮 Previous", icon = "󰒮" },
        { "]", group = "󰒭 Next", icon = "󰒭" },
        { "g", group = "󰉁 Go to", icon = "󰉁" },

        -- Specific keymaps with descriptions
        { "<leader>e", desc = "󰉋 File Explorer" },
        { "<leader>?", desc = "󰘥 Local Keymaps" },
        { "<leader>tt", desc = "󰄬 Toggle Terminal" },

        -- Buffer operations
        { "<leader>bx", desc = "󰖭 Delete Buffer" },
        { "]b", desc = "󰒭 Next Buffer" },
        { "[b", desc = "󰒮 Previous Buffer" },

        -- File operations  
        { "<leader>ff", desc = "󰈞 Find Files" },
        { "<leader>fg", desc = "󰈬 Live Grep" },
        { "<leader>fb", desc = "󰓩 Find Buffers" },
        { "<leader>fh", desc = "󰘥 Help Tags" },
        { "<leader>fn", desc = "󰈞 Neovim Files" },
        { "<leader>fr", desc = "󰛔 Search & Replace" },

        -- Git operations
        { "<leader>go", desc = "󰊢 Open Neogit" },
        { "<leader>gc", desc = "󰜘 Git Commit" },
        { "<leader>gd", desc = "󰉃 Git Diff" },
        { "<leader>gf", desc = "󰈞 Git File Status" },
        { "<leader>gp", desc = "󰐕 Git Push" },

        -- Git hunks
        { "<leader>hs", desc = "󰐖 Stage Hunk" },
        { "<leader>hr", desc = "󰜉 Reset Hunk" },
        { "<leader>hu", desc = "󰕌 Undo Stage Hunk" },
        { "<leader>hp", desc = "󰉇 Preview Hunk" },
        { "<leader>hb", desc = "󰊠 Blame Line" },
        { "<leader>hd", desc = "󰉃 Diff Index" },
        { "<leader>hB", desc = "󰊠 Toggle Blame" },

        -- LSP functions
        { "<leader>lr", desc = "󰑓 LSP Restart" },
        { "<leader>ca", desc = "󰌘 Code Actions" },
        { "<leader>d", desc = "󰒡 Show Diagnostics" },

        -- Trouble/Diagnostics
        { "<leader>xx", desc = "󰔫 Toggle Diagnostics" },
        { "<leader>xX", desc = "󰔫 Buffer Diagnostics" },
        { "<leader>xs", desc = "󰘦 Symbols" },
        { "<leader>xS", desc = "󰌘 LSP References" },
        { "<leader>xL", desc = "󰉁 Location List" },
        { "<leader>xQ", desc = "󰉁 Quickfix List" },

        -- TODO comments
        { "<leader>tx", desc = "󰄬 Todo (Trouble)" },
        { "<leader>ts", desc = "󰄬 Todo Search" },

        -- Markdown
        { "<leader>mr", desc = "󰍔 Render Markdown" },
        { "<leader>mp", desc = "󰍔 Preview Start" },
        { "<leader>ms", desc = "󰍔 Preview Stop" },

        -- Code formatting
        { "<leader>cf", desc = "󰘦 Format Code" },

        -- Yanking
        { "<leader>y", desc = "󰅌 Yank to Clipboard" },
        { "<leader>Y", desc = "󰅌 Yank Line to Clipboard" },

        -- Window management
        {
          "<leader>w",
          group = "󰖳 Windows",
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
