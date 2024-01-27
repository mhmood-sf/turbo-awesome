local HOME = os.getenv("HOME")
local awful = require "awful"
local wibox = require "wibox"
local pam = require "liblua_pam"
local notif = require "notif"

local function auth(pwd)
    return pam.auth_current_user(pwd)
end

-- A dummy textbox needed to get user input.
-- It will not be visible anywhere.
local some_textbox = wibox.widget.textbox()

local function grab_password()
    awful.prompt.run {
        hooks = {
            -- Custom escape behaviour: Do not cancel input with Escape
            -- Instead, this will just clear any input received so far.
            {{ }, 'Escape',
                function(_)
                    grab_password()
                end
            },
            -- Fix for Control+Delete crashing the keygrabber
            {{ 'Control' }, 'Delete', function ()
                grab_password()
            end}
        },
        exe_callback = function(input)
            -- Check input
            if auth(input) then
                notif.info("It worked!", "yay :D\nincreasining brightness nowwow ahaha")
            else
                notif.info("It failed!", "nay :D")
                grab_password()
            end
        end,
        textbox = some_textbox,
    }
end

return {
    with_auth = with_auth,
    grab_password = grab_password
}
