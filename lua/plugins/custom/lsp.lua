-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  -- Mason: LSP server manager
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    },
  },

  -- Mason-lspconfig: Bridge between mason and lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "pyright",     -- Python
        "clangd",      -- C++
        "lua_ls",      -- Lua
        "bashls",      -- Bash
        "r-languageserver"  -- R
      },
      automatic_installation = true,
    },
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap

      -- LSP keybinds
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gd",  require('telescope.builtin').lsp_definitions, opts)
        keymap.set("n", "gi", require('telescope.builtin').lsp_implementations, opts)
        keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap.set("n", "gR", vim.lsp.buf.rename, opts)
        keymap.set("n", "gt", require('telescope.builtin').lsp_type_definitions, opts)
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)
        keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
      end

      -- Completion capabilities
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Configure diagnostic signs
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        },
      })

      -- Configure LSP servers
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end,
  },
}
