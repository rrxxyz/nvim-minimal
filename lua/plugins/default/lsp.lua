return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },

  -- example using `opts` for defining servers
  opts = {
    servers = {
      lua_ls = {},
      -- pyright = {},
      -- rust_analyzer = {
      --   settings = {
      --     ["rust-analyzer"] = {
      --       cargo = { allFeatures = true },
      --     },
      --   },
      -- },
      -- clangd = {},
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local builtin = require("telescope.builtin")

    local keymap = vim.keymap
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      keymap.set("n", "gd", builtin.lsp_definitions, opts)
      keymap.set("n", "gi", builtin.lsp_implementations, opts)
      keymap.set("n", "gr", builtin.lsp_references, opts)
      keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap.set("n", "gR", vim.lsp.buf.rename, opts)
      keymap.set("n", "gt", builtin.lsp_type_definitions, opts)
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)
    end

    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      config.on_attach = on_attach
      lspconfig[server].setup(config)
    end

    -- Manual setup for kotlin-lsp
    -- local configs = require("lspconfig.configs")
    -- if not configs.kotlin_lsp then
    --   configs.kotlin_lsp = {
    --     default_config = {
    --       cmd = { "kotlin-lsp", "--stdio" },
    --       filetypes = { "kotlin" },
    --       root_dir = lspconfig.util.root_pattern(
    --         "settings.gradle",
    --         "settings.gradle.kts",
    --         "build.gradle",
    --         "build.gradle.kts",
    --         "gradlew",
    --         ".git"
    --       ),
    --       single_file_support = true,
    --     },
    --   }
    -- end
    --
    -- lspconfig.kotlin_lsp.setup({
    --   capabilities = require("blink.cmp").get_lsp_capabilities(),
    --   on_attach = on_attach,
    -- })

    vim.diagnostic.config({
      diagnostic = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        },
      },
    })
  end,
}
