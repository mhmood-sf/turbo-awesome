# turbo-awesome

## TODO

- [ ] `cfg/base`

- [ ] Work on the Volume/Brightness thing
  - Add mute for volume

- [ ] Better notifications

- [ ] Nice dashboard
  - Calendar
  - Battery
  - Temperature
  - RAM
  - Storage
  - Volume
  - Brightness
  - Layout
  - CLipboard contents?
  - List of open clients if any, including minimized clients if any.
  - Music player info? See `cmus-remote`

## Structure

- `bindings/` - Global and client bindings.
- `system/` - For interfacing with the system/external programs (i.e getting brightness/vol info, music clients, etc.).
- `cfg/` - Contains rest of the stuff like setting up screens, widgets, rules, signals, etc.
    - `cfg/base/` - 'base' contains a very basic default configuration, but otherwise contains lots of reusable UI elements and so on.
        - `cfg/base/ui/` - contains reusable widgets and other elements.
    - `cfg/XYZ/` - configuration named 'XYZ'
        - `cfg/XYZ/ui` - contains XYZ's own ui elements.

