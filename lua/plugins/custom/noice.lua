return {

        -- Noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function ()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
                cmdline = {
                    format = {
                        search_down = {
                            view = "cmdline",
                        },
                        search_up = {
                            view = "cmdline",
                        },
                    },
                },
                routes = {
                    {
                        filter = {
                            event = "lsp",
                            kind = "progress",
                            cond = function(message)
                                local client = vim.tbl_get(message.opts, "progress", "client")
                                return client == "lua_ls"
                            end,
                        },
                        opts = { skip = true },
                    },
                },
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

}
