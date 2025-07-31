-- ~/.config/nvim/lua/plugins/ui.lua
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
    -- Buffer line
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        keys = {
            { "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
            { "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
            { "<leader>bp", "<Cmd>BufferLinePick<CR>", desc = "Buffer pick" },
            { "<leader>bc", "<Cmd>BufferLinePickClose<CR>", desc = "Pick close" },
            { "<leader>[b", "<Cmd>BufferLineMovePrev<CR>", desc = "Move prev" },
            { "<leader>]b", "<Cmd>BufferLineMoveNext<CR>", desc = "Move next" },
            { "<leader>bH", "<Cmd>w<CR><Cmd>BufferLineCloseLeft<CR>", desc = "Close to the left" },
            { "<leader>bL", "<Cmd>w<CR><Cmd>BufferLineCloseRight<CR>", desc = "Close to the right" },
            { "<leader>bx", "<Cmd>wa<CR><Cmd>bdelete<CR>", desc = "Close buffer" },
            { "<leader>bX", "<Cmd>bdelete!<CR>", desc = "Force close buffer" },
            { "<leader>bA", "<Cmd>wa<CR><Cmd>%bdelete<CR>", desc = "Close all buffers" },
        },
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    themable = true,
                    numbers = "none",
                    close_command = "bdelete! %d",
                    right_mouse_command = "bdelete! %d",
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = nil,
                    indicator = {
                        icon = "▎",
                        style = "icon",
                    },
                    buffer_close_icon = "󰅖",
                    modified_icon = "●",
                    close_icon = "",
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    max_name_length = 30,
                    max_prefix_length = 30,
                    truncate_names = true,
                    tab_size = 21,
                    diagnostics = "nvim_lsp",
                    diagnostics_update_in_insert = false,
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                    custom_filter = function(buf_number, buf_numbers)
                        -- filter out filetypes you don't want to see
                        if vim.bo[buf_number].filetype ~= "oil" then
                            return true
                        end
                    end,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "left",
                            separator = true,
                        },
                    },
                    color_icons = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    show_duplicate_prefix = true,
                    persist_buffer_sort = true,
                    move_wraps_at_ends = false,
                    separator_style = "slant",
                    enforce_regular_tabs = true,
                    always_show_bufferline = true,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { "close" },
                    },
                    sort_by = "insert_after_current",
                },
            })
        end,
    },
    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    },

    -- Icons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}
