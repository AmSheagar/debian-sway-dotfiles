# Debian Sway Dotfiles

Personal and opinionated dotfiles for **Debian GNU/Linux + Sway + Wayland**, with a macOS-inspired keyboard workflow.

This repository is designed as a starting point for people who want a clean Sway setup while keeping familiar macOS-style keyboard shortcuts.

> **⚠️ Important:** This configuration is opinionated and was created for my own Debian system. Read the installation section before using `install.sh`. You may need to adapt monitor settings, applications, and other hardware-specific options.

## Features

- Sway window manager configuration
- Kitty terminal configuration
- Zsh as the default shell
- macOS-style keyboard shortcuts
- Logitech keyboard configured with macOS-like modifier behavior
- `⌘C` / `⌘V` clipboard workflow
- Automatic copy when selecting text in Kitty
- Noctalia integration
- Automatic Noctalia daemon watchdog
- Autotiling
- Nautilus file manager
- Zen Browser launcher
- Catppuccin-inspired Kitty configuration

## macOS-style keyboard

The physical Command keys are mapped to `Super`, while Option keys are mapped to `Alt`.

This allows the keyboard to behave similarly to macOS while still using Sway's native modifier system.

### Kitty

| Shortcut | Action |
|---|---|
| `⌘C` | Copy |
| `⌘V` | Paste |
| `Ctrl+C` | Interrupt running process |
| `Ctrl+Z` | Suspend running process |
| Select text | Automatically copy |

Kitty's native `Ctrl+Shift+C` and `Ctrl+Shift+V` shortcuts remain available.

### Other applications

| Shortcut | Action |
|---|---|
| `⌘C` | `Ctrl+C` |
| `⌘V` | `Ctrl+V` |
| `⌘X` | `Ctrl+X` |
| `⌘Z` | `Ctrl+Z` |
| `⌘Y` | `Ctrl+Y` |
| `⌘A` | `Ctrl+A` |
| `⌘F` | `Ctrl+F` |
| `⌘N` | `Ctrl+N` |

## Requirements

The main dependencies are available from Debian repositories:

- Sway
- Kitty
- Zsh
- `wtype`
- `jq`
- Nautilus
- `autotiling`

The configuration also expects:

- Noctalia
- Zen Browser

These may require installation or configuration outside of APT depending on your system.

## Installation

Clone the repository:

```bash
git clone https://github.com/AmSheagar/debian-sway-dotfiles.git
cd debian-sway-dotfiles
```

Make the installer executable:

```bash
chmod +x install.sh
```

Run it:

```bash
./install.sh
```

The installer:

1. Checks whether the required commands are available.
2. Installs missing Debian packages when possible.
3. Creates the required configuration directories.
4. Backs up existing Sway and Kitty configurations.
5. Installs the repository configuration files.
6. Installs the helper scripts.
7. Preserves executable permissions on the scripts.

### Backups

If an existing Sway or Kitty configuration is found, the installer creates a backup under:

```text
~/.config-backup/
```

The backup directory includes a timestamp so previous configurations are not overwritten.

## Hardware-specific settings

The current Sway configuration includes monitor settings for the author's setup:

```ini
output DP-1 mode 1920x1080@120Hz
output DP-2 mode 1920x1080@120Hz
```

These lines may need to be changed or removed on another computer.

To see the outputs detected by Sway:

```bash
swaymsg -t get_outputs
```

## Repository layout

```text
debian-sway-dotfiles/
├── .gitignore
├── README.md
├── install.sh
├── kitty/
│   └── kitty.conf
├── scripts/
│   ├── mac-copy
│   ├── mac-paste
│   └── noctalia-watch
└── sway/
    └── config
```

## Scripts

### `mac-copy`

Detects the focused application.

In Kitty it sends Kitty's native copy shortcut:

```text
Ctrl+Shift+C
```

For other applications it sends:

```text
Ctrl+C
```

### `mac-paste`

Detects the focused application.

In Kitty it sends:

```text
Ctrl+Shift+V
```

For other applications it sends:

```text
Ctrl+V
```

### `noctalia-watch`

Keeps the Noctalia daemon running while the Sway session is active.

## Customization

This repository is intentionally simple.

The recommended approach is to clone it and then modify the configuration files to match your own:

- keyboard layout
- monitor configuration
- preferred applications
- Sway keybindings
- Kitty appearance
- Noctalia configuration
- scripts

## License

No license has been selected yet.

If this project becomes useful to other people, a license can be added later.
