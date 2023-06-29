local beautiful = require "beautiful"

local HOME = os.getenv("HOME")

-- Terminal: kitty
terminal = "kitty"

-- Browser: firefox
browser = HOME .. "/Downloads/firefox/firefox"

-- Launcher: rofi
launcher = "rofi -show drun -theme " .. beautiful.rofi

-- File Manager: Thunar
filemanager = "thunar"

-- Music player: cmus
musicplayer = terminal .. " -e cmus"

-- Screenshot command
screenshot = "flameshot gui"

-- Notes
notes = HOME .. "/Downloads/obsidian/Obsidian-1.3.3.AppImage"
