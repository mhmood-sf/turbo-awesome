local s = require"awful".spawn
local ss = s.with_shell

-- Start compositor in background.
s("picom -bf -D 5")

-- Enable tapping on touchpad.
s("xinput set-prop 'MSFT0004:00 06CB:CD98 Touchpad' 'libinput Tapping Enabled' 1")

-- Enable natural scrolling on touchpad.
s("xinput set-prop 'MSFT0004:00 06CB:CD98 Touchpad' 'libinput Natural Scrolling Enabled' 1")

-- Set nightlight
s("xrandr --output eDP --gamma 1.0:0.93:0.81 --brightness 1")

-- Turn off system beep
s("xset b off")
s("xset b 0 0 0")

-- Start Touchegg
s("touchegg")
