return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        default_integrations = false,
        auto_integrations = true,

        highlight_overrides = {
          all = function(colors)
            return {
              CurSearch = { bg = colors.pink },
              IncSearch = { bg = colors.sky },
              CursorLineNr = { fg = colors.sky, style = { "bold" } },
              -- Make line numbers more visible with lighter color
              LineNr = { fg = colors.overlay2, style = { "bold" } },
              -- Make visual selection more visible with lighter background
              Visual = { bg = colors.overlay0, fg = colors.text },
              -- Make visual line selection also lighter
              VisualNOS = { bg = colors.surface2, fg = colors.text },
              DashboardFooter = { fg = colors.overlay0 },
              TreesitterContextBottom = { style = {} },
              WinSeparator = { fg = colors.overlay0, style = { "bold" } },
              ["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
              ["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
              Headline = { style = { "bold" } },
              Headline1 = { fg = colors.pink, style = { "bold" } },
              Headline2 = { fg = colors.blue, style = { "bold" } },
              Headline3 = { fg = colors.lavender, style = { "bold" } },
              Headline4 = { fg = colors.green, style = { "bold" } },
              Headline5 = { fg = colors.peach, style = { "bold" } },
              Headline6 = { fg = colors.flamingo, style = { "bold" } },
              rainbow1 = { fg = colors.blue, style = { "bold" } },
              rainbow2 = { fg = colors.pink, style = { "bold" } },
              rainbow3 = { fg = colors.lavender, style = { "bold" } },
              rainbow4 = { fg = colors.green, style = { "bold" } },
              rainbow5 = { fg = colors.peach, style = { "bold" } },
              rainbow6 = { fg = colors.flamingo, style = { "bold" } },
            }
          end,
        },
        color_overrides = {
          macchiato = {
            -- Cyberpunk neon colors
            rosewater = "#FF6EC7", -- Hot pink neon
            flamingo = "#FF79C6", -- Bright magenta
            pink = "#BD93F9", -- Electric purple
            mauve = "#FF92D0", -- Neon pink
            red = "#FF5555", -- Bright red
            maroon = "#FF6E6E", -- Coral red
            peach = "#FFB86C", -- Warm orange
            yellow = "#F1FA8C", -- Electric yellow
            green = "#50FA7B", -- Matrix green
            teal = "#8BE9FD", -- Cyan blue
            sky = "#6BE5FF", -- Sky blue
            sapphire = "#74C7EC", -- Light blue
            blue = "#6FDBFF", -- Electric blue
            lavender = "#B4BEFE", -- Soft purple
            -- Text and UI with moonlight feel
            text = "#F8F8F2", -- Bright white text
            subtext1 = "#E6E6FA", -- Lavender white
            subtext0 = "#BFBFBF", -- Silver
            overlay2 = "#6272A4", -- Muted blue-gray
            overlay1 = "#44475A", -- Dark blue-gray
            overlay0 = "#373844", -- Darker blue-gray
            surface2 = "#282A36", -- Dark surface
            surface1 = "#1E1F29", -- Darker surface
            surface0 = "#181920", -- Very dark surface
            base = "#0D1117", -- Deep dark base (GitHub dark)
            mantle = "#080B10", -- Almost black
            crust = "#030508", -- Pure dark
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({
        render = 'background',
        virtual_symbol = '■',
        enable_named_colors = true,
        enable_tailwind = false,
      })
    end,
  },
}
