return {
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
}
