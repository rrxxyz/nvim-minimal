-- Given hightlight when do yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("nvim-minimal-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Plugin Management Commands
local plugin_manager = require("commands.plugin_manager")

vim.api.nvim_create_user_command("PluginStatus", function()
  plugin_manager.show_plugin_status()
end, { desc = "Show plugin status" })

vim.api.nvim_create_user_command("PluginConfig", function()
  plugin_manager.edit_config()
end, { desc = "Edit plugin configuration" })

vim.api.nvim_create_user_command("PluginToggle", function(opts)
  local args = vim.split(opts.args, " ", true)
  if #args ~= 2 then
    vim.notify("Usage: :PluginToggle <category> <plugin_name>", vim.log.levels.ERROR)
    return
  end
  plugin_manager.toggle_plugin(args[1], args[2])
end, { 
  desc = "Toggle a custom plugin", 
  nargs = "*",
  complete = function()
    return { "ui", "dev_tools", "content", "productivity" }
  end
})
