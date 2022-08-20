-- Init theme
local theme = require "themes.aks"
local beautiful = require "beautiful"
beautiful.init(theme)

local HOME = os.getenv("HOME")

-- Default modkey
modkey = "Mod4"

-- Terminal: kitty
terminal = "kitty"

-- Browser: firefox
browser = HOME .. "/Downloads/firefox/firefox"

-- Launcher: rofi
launcher = "rofi -show drun -theme " .. theme.rofi

-- File Manager: Thunar
filemanager = "thunar"

-- Music player: cmus
musicplayer = terminal .. " -e cmus"

-- Screenshot command
screenshot = "flameshot gui"

-- Run compositor in the background
require"awful".spawn("picom -b")

-- Set up global/client bindings
-- NOTE: Needs to be called first for some reason.
require "bindings"

-- Delegate everything else to configuration
require "cfg.gamma"
