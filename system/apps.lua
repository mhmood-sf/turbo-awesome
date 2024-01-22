local beautiful = require "beautiful"

local HOME = os.getenv("HOME")

-- Terminal: kitty
terminal = "wezterm.AppImage"

-- Browser: firefox
browser = HOME .. "/Downloads/firefox/firefox"

-- File Manager: Thunar
filemanager = "thunar"

-- Music player: cmus
musicplayer = terminal .. " -e cmus"

-- Screenshot command
screenshot = "flameshot gui"

-- Notes
notes = HOME .. "/Downloads/obsidian/Obsidian.AppImage"

-- Email
email = HOME .. "/Downloads/thunderbird/thunderbird"
