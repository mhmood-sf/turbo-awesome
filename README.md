# turbo-awesome

TODO: Make this readme a bit more compact. See elenapan and axarva and others' READMEs.
My AwesomeWM configuration.

## Setup

#### LightDM

Install [slick-greeter](https://github.com/linuxmint/slick-greeter) and enable it:
1. `sudo vi /etc/lightdm/lightdm.conf`
2. Set `greeter-session=slick-greeter`.
3. Restart lightdm (e.g `systemctl restart lightdm.service`, which may also reboot your computer).
4. Create `/etc/lightdm/slick-greeter.conf`.
5. Paste config into `/etc/lightdm/slick-greeter.conf`:
```conf
...
```
6. Copy the background into ...

#### Font

[Cascadia Code PL](https://github.com/microsoft/cascadia-code)

#### Apps

###### Editor (Neovim)

[Neovim](https://neovim.io/). See my neovim configuration at [quintik/turbo-nvim](https://github.com/quintik/turbo-nvim).

#### Rofi
TODO: Include the rofi config in themes as well and edit the rofi command to use that from there.
The rofi theme and config is included in the `themes/`.

#### Dracula

See the [dracula theme](https://draculatheme.com) website for most of the color/theme related stuff. Quick instructions below for setting up dracula for some of the programs I use:

###### GTK

See [draculatheme/gtk](https://draculatheme.com/gtk) for installing the GTK theme and icon files. The instructions given there are for Gnome, and did not work for me on AwesomeWM. I followed the steps below to get it working:
1. Create `~/.themes` and `~/.icons` directories. You can use `usr/share` instead but I prefer keeping them under `~`.
2. Install the dracula GTK theme .zip from the website and extract it inside `~/.themes`. The extracted folder will be named `gtk-master` (or something along those lines, at least as of when this is being written). Rename it to `Dracula`.
3. Install the icon files .zip from the website and extract it inside `~/.icons`. The extracted folder will already be named `Dracula`, but if it is not then rename it.
4. Check `~/.config/` for `gtk-x.x` folders where `x.x` is the gtk version. In my case I only had 2.0 and 3.0. `gtk-2.0` did not have any significant files in it, but `gtk-3.0` had some css files, an `assets/` folder, and a `settings.ini` file.
5. Edit the `settings.ini` file and set the following two properties:
    ```ini
    [Settings]
    ...
    gtk-icon-theme-name=Dracula
    gtk-theme-name=Dracula
    ...
    ```
6. Open a GTK application like Thunar and it should be working!

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

