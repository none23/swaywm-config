# Sway configuration

Personal configuration for Sway, Waybar, Swappy, and Sworkstyle on Arch Linux.

## Install

Install Sway and the applications referenced by the configuration, then install `keyd`:

```sh
sudo pacman -S keyd
```

Run the installer from this repository:

```sh
./install.sh
swaymsg reload
```

The installer links the tracked configurations into `$XDG_CONFIG_HOME` (or `~/.config`), installs
`keyd/default.conf` as `/etc/keyd/default.conf`, and enables `keyd`. It refuses to
replace existing config paths that do not already point into this repository.

## Keyboard mapping

The keyboard behavior depends on the system-level `keyd` configuration shipped in this repository:

- Caps Lock emits Escape.
- The physical Escape key emits F19.
- `$mod+F19` kills the focused Sway client.

F19 is used as a sentinel because it is not present on the keyboards this configuration targets.
Without `keyd`, Caps Lock remains Caps Lock and the physical Escape key cannot trigger the F19
binding.
