-- Custom Plugin Configuration
-- Enable/disable optional plugins here

local M = {}

-- 🎨 UI & APPEARANCE
M.ui = {
  lualine = true,        -- Status line
  dashboard = true,      -- Start screen
}

-- 🔧 DEVELOPMENT TOOLS  
M.dev_tools = {
  gitsign = true,        -- Git integration & hunks (file: gitsign.lua)
  neogit = false,         -- Advanced git interface
  trouble = true,        -- Diagnostics panel
  todocomment = true,    -- TODO comment highlighting
}

-- 📝 CONTENT & WRITING
M.content = {
  markdown = true,       -- Markdown preview & rendering
  obsidian = false,      -- Obsidian vault integration
}

-- 🚀 PRODUCTIVITY
M.productivity = {
  grug = true,           -- Search & replace tool
  supermaven = false,    -- AI code completion
}

-- Function to check if a custom plugin is enabled
function M.is_enabled(category, plugin_name)
  return M[category] and M[category][plugin_name] == true
end

-- Function to get all enabled plugins
function M.get_enabled_plugins()
  local enabled = {}
  
  for category, plugins in pairs(M) do
    if type(plugins) == "table" then
      for plugin_name, is_enabled in pairs(plugins) do
        if is_enabled then
          table.insert(enabled, {
            category = category,
            name = plugin_name,
            file = plugin_name .. ".lua"
          })
        end
      end
    end
  end
  
  return enabled
end

return M
