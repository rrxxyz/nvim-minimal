return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
    end,
    keys = {
        {
            "<leader>ha",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Harpoon Add File",
        },
        {
            "<leader>hm",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            desc = "Harpoon Quick Menu",
        },
        {
            "<leader>1",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "Harpoon Select 1",
        },
        {
            "<leader>2",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "Harpoon Select 2",
        },
        {
            "<leader>3",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "Harpoon Select 3",
        },
        {
            "<leader>4",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "Harpoon Select 4",
        },
        {
            "<C-S-P>",
            function()
                require("harpoon"):list():prev()
            end,
            desc = "Harpoon Prev",
        },
        {
            "<C-S-N>",
            function()
                require("harpoon"):list():next()
            end,
            desc = "Harpoon Next",
        },
    },
}
