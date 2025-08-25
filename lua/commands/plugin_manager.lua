-- Plugin Management Commands
local M = {}

-- Show plugin status
function M.show_plugin_status()
  local custom_config = require("plugins.custom_config")
  local enabled_plugins = custom_config.get_enabled_plugins()
  
  print("\n🚀 NEOVIM PLUGIN STATUS")
  print("=" .. string.rep("=", 40))
  
  -- Default plugins (always enabled)
  print("\n📌 DEFAULT PLUGINS (Always Enabled):")
  local default_plugins = {
    "lsp", "completion", "treesitter", "telescope", 
    "mason", "whichkey", "colorscheme", "formatter"
  }
  for _, plugin in ipairs(default_plugins) do
    print("  ✅ " .. plugin)
  end
  
  -- Custom plugins by category
  local categories = {
    { name = "🎨 UI & APPEARANCE", key = "ui" },
    { name = "🔧 DEVELOPMENT TOOLS", key = "dev_tools" },
    { name = "📝 CONTENT & WRITING", key = "content" },
    { name = "🚀 PRODUCTIVITY", key = "productivity" },
  }
  
  for _, category in ipairs(categories) do
    print("\n" .. category.name .. ":")
    local category_plugins = custom_config[category.key]
    if category_plugins then
      for plugin_name, is_enabled in pairs(category_plugins) do
        local status = is_enabled and "✅" or "❌"
        print("  " .. status .. " " .. plugin_name)
      end
    end
  end
  
  print("\nTotal enabled custom plugins: " .. #enabled_plugins)
end

-- Toggle a custom plugin
function M.toggle_plugin(category, plugin_name)
  local config_path = vim.fn.stdpath("config") .. "/lua/plugins/custom_config.lua"
  
  -- Read the current config file
  local file = io.open(config_path, "r")
  if not file then
    vim.notify("Could not open custom_config.lua", vim.log.levels.ERROR)
    return
  end
  
  local content = file:read("*a")
  file:close()
  
  -- Find and toggle the specific plugin
  local pattern = "(" .. plugin_name .. "%s*=%s*)(%w+)"
  local new_content = content:gsub(pattern, function(prefix, current_value)
    local new_value = current_value == "true" and "false" or "true"
    vim.notify("Toggled " .. plugin_name .. ": " .. current_value .. " → " .. new_value, vim.log.levels.INFO)
    return prefix .. new_value
  end)
  
  -- Write back to file
  local write_file = io.open(config_path, "w")
  if write_file then
    write_file:write(new_content)
    write_file:close()
    vim.notify("Plugin configuration updated. Restart Neovim to apply changes.", vim.log.levels.INFO)
  else
    vim.notify("Failed to write to custom_config.lua", vim.log.levels.ERROR)
  end
end

-- Open custom config file for editing
function M.edit_config()
  vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/plugins/custom_config.lua")
end

return M