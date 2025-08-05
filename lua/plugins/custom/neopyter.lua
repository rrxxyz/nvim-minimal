return {
  {
    "SUSTech-data/neopyter",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter', -- neopyter don't depend on `nvim-treesitter`, but does depend on treesitter parser of python
      'AbaoFromCUG/websocket.nvim',      -- for mode='direct'
    },
    config = function ()
      require("blink-cmp").setup({
        sources = {
          per_filetype = {
            python = { inherit_defaults = true, "neopyter" },
          },
          providers = {
            neopyter = {
              name = "Neopyter",
              module = "neopyter.blink",
              opts = {},
            },
          },
        },
      })

      require'nvim-treesitter.configs'.setup {
        textobjects = {
          move = {
            enable = true,
            goto_next_start = {
              ["]j"] = "@cellseparator",
            },
            goto_previous_start = {
              ["[j"] = "@cellseparator",
            },
          },
        },
      }
    end,

    opts = {
      mode = "direct",
      remote_address = "127.0.0.1:9001",
      file_pattern = { "*.ju.*" },
      on_attach = function(buf)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = buf })
        end
        -- same, recommend the former
        map("n", "<leader>nc", "<cmd>Neopyter execute notebook:run-cell<cr>", "run selected")

        -- same, recommend the former
        map("n", "<leader>na", "<cmd>Neopyter execute notebook:run-all-above<cr>", "run all above cell")

        map("n", "<leader>nr", "<cmd>Neopyter execute kernelmenu:restart<cr>", "restart kernel")

        map("n", "<C-]>", "<cmd>Neopyter execute notebook:run-cell-and-select-next<cr>", "run selected and select next")

        map("n", "<leader>nR", "<cmd>Neopyter execute notebook:restart-run-all<cr>", "restart kernel and run all")
      end
    },
  }
}
