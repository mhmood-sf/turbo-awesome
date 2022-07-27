local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"
local ICONS_DIR = THEMES .. "/icons"

return {
    layout = {
        spiral   = ICONS_DIR .. "/icons/layout/spiralw.png",
        floating = ICONS_DIR .. "/icons/layout/floatingw.png",
    },

    apps = {
        office      = ICONS_DIR .. "/icons/apps/stack-fill-light.png",
        browser     = ICONS_DIR .. "/icons/apps/firefox-fill-light.png",
        obsidian    = ICONS_DIR .. "/icons/apps/obsidian.png",
        terminal    = ICONS_DIR .. "/icons/apps/terminal-window-fill-light.png",
        filemanager = ICONS_DIR .. "/icons/system/folders-fill-light.png",
        musicplayer = ICONS_DIR .. "/icons/apps/headphones-fill-light.png"
    },

    system = {
        cpu  = ICONS_DIR .. "/icons/system/gauge.png",
        mem  = ICONS_DIR .. "/icons/system/cpu.png",
        temp = ICONS_DIR .. "/icons/system/thermometer-simple.png",

        audio = {
            mute   = ICONS_DIR .. "/icons/system/speaker-x.png",
            high   = ICONS_DIR .. "/icons/system/speaker-high.png",
            medium = ICONS_DIR .. "/icons/system/speaker-low.png",
            low    = ICONS_DIR .. "/icons/system/speaker-none.png",
        },

        brightness = {
            high   = ICONS_DIR .. "/icons/system/sun.png",
            low    = ICONS_DIR .. "/icons/system/sun-dim.png",
        },

        battery = {
            low      = ICONS_DIR .. "/icons/system/battery-low.png",
            high     = ICONS_DIR .. "/icons/system/battery-high.png",
            charging = ICONS_DIR .. "/icons/system/battery-charging.png",
        },

        interface = {
            shutdown = ICONS_DIR .. "/icons/system/power-fill-light.png",
            reboot = ICONS_DIR .. "/icons/system/arrow-clockwise-fill-light.png"
        }
    }
}
