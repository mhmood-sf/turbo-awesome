-- Run compositor in the background
local s = require"awful".spawn

-- Start compositor in background.
s("picom -bcf -D 5")

-- Enable tapping on touchpad.
s("xinput set-prop 'MSFT0004:00 06CB:CD98 Touchpad' 'libinput Tapping Enabled' 1")

-- Enable natural scrolling on touchpad.
s("xinput set-prop 'MSFT0004:00 06CB:CD98 Touchpad' 'libinput Natural Scrolling Enabled' 1")

-- Start pulseaudio in the background for sound.
s("pulseaudio -D")

-- Start touchegg for gestures
s("touchegg")
