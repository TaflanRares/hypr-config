-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--    RARES' MINIMAL HYPRLAND CONFIG.              --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local baseDir = (debug.getinfo(1, "S").source:sub(2):match("(.*/)") or "./")
local function loadPart(path)
    local fullPath = baseDir .. path
    local ok, result = pcall(dofile, fullPath)
    if not ok then
        error("hyprland.lua: failed to load " .. fullPath .. "\n" .. tostring(result))
    end
    return result
end

hl.monitor({
    output = "",
    mode = "1920x1080",
    position = "auto",
    scale = "auto",
})

local ctx = {
    colors = loadPart("hyprland/colors.lua"),
    programs = {
        terminal = "kitty",
        fileManager = "thunar",
        menu = "noctalia msg panel-toggle launcher",
    },
}

for _, part in ipairs({
    "hyprland/autostart.lua",
    "hyprland/env.lua",
    "hyprland/look.lua",
    "hyprland/misc.lua",
    "hyprland/input.lua",
    "hyprland/keybinds.lua",
    "hyprland/rules.lua",
}) do
    local module = loadPart(part)
    if type(module) ~= "function" then
        error("hyprland.lua: module must return function: " .. part)
    end
    module(ctx)
end
