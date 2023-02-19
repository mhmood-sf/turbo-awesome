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
        spiral_light   = ICONS_DIR .. "/layout/spiral-light.png",
        floating_light = ICONS_DIR .. "/layout/floating-light.png",
        spiral_dark    = ICONS_DIR .. "/layout/spiral-dark.png",
        floating_dark  = ICONS_DIR .. "/layout/floating-dark.png",
    },

    apps = {
        office_light      = ICONS_DIR .. "/apps/stack-fill-light.png",
        browser_light     = ICONS_DIR .. "/apps/firefox-fill-light.png",
        terminal_light    = ICONS_DIR .. "/apps/terminal-window-fill-light.png",
        filemanager_light = ICONS_DIR .. "/apps/folders-fill-light.png",
        musicplayer_light = ICONS_DIR .. "/apps/headphones-fill-light.png",
        obsidian          = ICONS_DIR .. "/apps/obsidian.png",
    },

    system = {
        cpu_dark  = ICONS_DIR .. "/system/cpu-dark.png",
        mem_dark  = ICONS_DIR .. "/system/mem-dark.png",
        temp_dark = ICONS_DIR .. "/system/temp-dark.png",

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
            warning_light  = ICONS_DIR .. "/system/battery-warning-light.png",
            low_light      = ICONS_DIR .. "/system/battery-low-light.png",
            med_light      = ICONS_DIR .. "/system/battery-medium-light.png",
            high_light     = ICONS_DIR .. "/system/battery-full-light.png",
            charging_light = ICONS_DIR .. "/system/battery-charging-light.png",
        },

        interface = {
            reboot   = ICONS_DIR .. "/system/reboot-fill-light.png",
            shutdown = ICONS_DIR .. "/system/power-fill-light.png"
        }
    }
}
