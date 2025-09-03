-- Luacheck configuration
std = "luajit"

-- Global variables
globals = {
    "vim",
}

-- Ignore specific warnings
ignore = {
    "212", -- Unused argument
    "213", -- Unused loop variable  
    "631", -- Line is too long
}

-- Files to exclude
exclude_files = {
    ".luacheckcache/*",
}

-- Read globals from other files
read_globals = {
    "vim",
}