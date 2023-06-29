# turbo-awesome

### Restructuring
- Move basically ALL ui/widgets to cfg/base (maybe rename it cfg/widgets? or a
  new separate directory?).
- The configurations (alpha/gamma/etc.) then JUST import those widgets and USE
  them.

Because right now it's very confusing, how some widgets are in the cfg's own
directory, how some are in base, etc. etc.


### Re-do theming
The files in `themes/` should just export colors, icons, and
other basic stuff. Then the cfg should use those colors (ONLY) to handle
coloring stuff. The themes can export base colors (like red, green, blue, etc)
and then also semantic color fields (so like "info", "warning", "accent",
"prominent", etc.)

### Bindings
- Every cfg should expose functions to handle bindings (except very basic
  ones). For example, for `<mod>d`, the cfg should expose a "switch_tag_right"
  function or something. the bindings file then imports this and passes it to
  the binding function.
- This allows cfgs to basically update ui and do other stuff when bindings are
  triggered.
- TODO: As an example: whenever a tag is switched, call flameshot to take a
  screen of the window first, then store it in some tmp directory. then for the
  taglist, create a tooltip thing that will show a preview of the tag on hover.

### Misc
- Nicer bar please. top-right, just a hamburger menu maybe, and then top-left a
  profile picture sort of thing that will open a dashboard on click.
- Titlebars: try `client.shape` instead of the complicated titlebar shape I'm
  doing rn (which doesn't even work well with picom)

## Structure

- `bindings/`: Global and client-local keybindings.
- `cfg/`: Various configurations. Configurations are responsible for handling
  widgets, screens, signals, rules, etc.
- `lib/`: Third-party modules (e.g rubato).
- `notif/`: Module for notifications.
- `system/`: Modules for handling system-related things that are external to
  awesomewm, like audio, brightness, music clients, etc.
- `themes/`: Awesome themes, responsible mainly for the colors & icons used.
- `utils/`: Other utilities.
- `misc/`: configs for other stuff i use in my setup. usually not up-to-date though.
