-- Init theme
local theme = require "themes.cat_mauve"
local beautiful = require "beautiful"
beautiful.init(theme)

local HOME = os.getenv("HOME")

-- Default modkey
modkey = "Mod4"

-- Terminal: kitty
terminal = "kitty"
-- Editor: neovim
editor = terminal .. " -e " .. HOME .. "/Downloads/neovim/nvim.appimage"
-- Browser: firefox
browser = HOME .. "/Downloads/firefox/firefox"
-- Launcher: rofi
launcher = "rofi -show drun -theme " .. theme.rofi
-- File Manager: Thunar
filemanager = "thunar"
-- Music player: cmus
musicplayer = terminal .. " -e " .. "cmus"

-- Run the custom notification stuff.
--require "notif"

-- Set up global/client bindings
-- NOTE: Needs to be called first for some reason.
require "bindings"

-- Delegate everything else to configuration
require "cfg.alpha"
