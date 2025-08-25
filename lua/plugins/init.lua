-- Plugin Loader for Default and Custom Plugins
local M = {}

-- Load all default plugins (always enabled)
function M.load_default_plugins()
  local default_plugins = {}
  local default_path = vim.fn.stdpath("config") .. "/lua/plugins/default"
  
  -- Get all Lua files in default directory
  local files = vim.fn.glob(default_path .. "/*.lua", false, true)
  
  for _, file in ipairs(files) do
    local filename = vim.fn.fnamemodify(file, ":t:r") -- Get filename without extension
    local plugin_config = require("plugins.default." .. filename)
    
    if type(plugin_config) == "table" then
      if plugin_config[1] or plugin_config.name then
        -- Single plugin
        table.insert(default_plugins, plugin_config)
      else
        -- Multiple plugins in one file
        for _, plugin in ipairs(plugin_config) do
          table.insert(default_plugins, plugin)
        end
      end
    end
  end
  
  return default_plugins
end

-- Load enabled custom plugins based on configuration
function M.load_custom_plugins()
  local custom_plugins = {}
  local custom_config = require("plugins.custom_config")
  local enabled_plugins = custom_config.get_enabled_plugins()
  
  for _, plugin_info in ipairs(enabled_plugins) do
    local success, plugin_config = pcall(require, "plugins.custom." .. plugin_info.name)
    
    if success and type(plugin_config) == "table" then
      if plugin_config[1] or plugin_config.name then
        -- Single plugin
        table.insert(custom_plugins, plugin_config)
      else
        -- Multiple plugins in one file
        for _, plugin in ipairs(plugin_config) do
          table.insert(custom_plugins, plugin)
        end
      end
    else
      vim.notify("Failed to load custom plugin: " .. plugin_info.name, vim.log.levels.WARN)
    end
  end
  
  return custom_plugins
end

-- Get all plugins (default + enabled custom)
function M.get_all_plugins()
  local all_plugins = {}
  
  -- Load default plugins
  local default_plugins = M.load_default_plugins()
  for _, plugin in ipairs(default_plugins) do
    table.insert(all_plugins, plugin)
  end
  
  -- Load enabled custom plugins
  local custom_plugins = M.load_custom_plugins()
  for _, plugin in ipairs(custom_plugins) do
    table.insert(all_plugins, plugin)
  end
  
  return all_plugins
end

return M