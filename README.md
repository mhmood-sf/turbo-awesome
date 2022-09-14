# turbo-awesome

## TODO

Restructure a little bit:
- Move basically ALL ui/widgets to cfg/base (maybe rename it cfg/widgets? or a
  new separate directory?).
- The configurations (alpha/gamma/etc.) then JUST import those widgets and USE
  them.

Because right now it's very confusing, how some widgets are in the cfg's own
directory, how some are in base, etc. etc.

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
