-- TODO: Rename ALL icons to follow the following format:
-- TODO: <namespace>-<modifiers>-<"fill"|"no-fill">-<"light"-"dark"-"color">.<"png"|"svg">

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"
local ICONS_DIR = THEMES .. "/icons/files"

return {
    ui = {
        pacman = ICONS_DIR .. "/ui/pacman.svg",
        ghost_blue = ICONS_DIR .. "/ui/ghost-blue.svg",
        ghost_light = ICONS_DIR .. "/ui/ghost-light.svg"
    },

    layout = {
        spiral   = ICONS_DIR .. "/layout/spiralw.png",
        floating = ICONS_DIR .. "/layout/floatingw.png",
    },

    apps = {
        office      = ICONS_DIR .. "/apps/stack-fill-light.png",
        browser     = ICONS_DIR .. "/apps/firefox-fill-light.png",
        obsidian    = ICONS_DIR .. "/apps/obsidian.png",
        terminal    = ICONS_DIR .. "/apps/terminal-window-fill-light.png",
        filemanager = ICONS_DIR .. "/system/folders-fill-light.png",
        musicplayer = ICONS_DIR .. "/apps/headphones-fill-light.png"
    },

    system = {
        cpu  = ICONS_DIR .. "/system/gauge.png",
        mem  = ICONS_DIR .. "/system/cpu.png",
        temp = ICONS_DIR .. "/system/thermometer-simple.png",

        audio = {
            mute   = ICONS_DIR .. "/system/speaker-x.png",
            high   = ICONS_DIR .. "/system/speaker-high.png",
            medium = ICONS_DIR .. "/system/speaker-low.png",
            low    = ICONS_DIR .. "/system/speaker-none.png",
        },

        brightness = {
            high   = ICONS_DIR .. "/system/sun.png",
            low    = ICONS_DIR .. "/system/sun-dim.png",
        },

        battery = {
            low      = ICONS_DIR .. "/system/battery-low.png",
            high     = ICONS_DIR .. "/system/battery-high.png",
            charging = ICONS_DIR .. "/system/battery-charging.png",
        },

        interface = {
            reboot   = ICONS_DIR .. "/system/arrow-clockwise-fill-light.png",
            shutdown = ICONS_DIR .. "/system/power-fill-light.png"
        }
    }
}
