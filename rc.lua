-- Init theme
local theme = require "themes.lazyfox"
local beautiful = require "beautiful"
beautiful.init(theme)

-- Default modkey
modkey = "Mod4"

-- System related stuff like audio/display/etc.
require "system.brightness"
require "system.nightlight"
require "system.audio"
-- General startup commands (starts picom, runs xinput commands, etc.)
require "system.startup"

-- This file declares global variables for running applications
-- like the file manager or browser etc.
require "system.apps"

-- Set up global/client bindings
-- (needs to be before cfg for some reason)
require "bindings"

-- Delegate everything else to configuration
require "cfg.gamma"
