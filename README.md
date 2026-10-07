# Debian Sway Dotfiles

Personal configuration files for a Debian GNU/Linux desktop running Sway and Wayland.

## What's included

- **Sway** — window manager configuration and keyboard shortcuts.
- **Kitty** — terminal configuration, fonts, clipboard behavior, and mouse bindings.
- **Scripts** — helper scripts used by the Sway configuration.
  - `mac-copy` — provides macOS-style `⌘C` behavior.
  - `mac-paste` — provides macOS-style `⌘V` behavior.
  - `noctalia-watch` — keeps the Noctalia daemon running.

## Keyboard behavior

The configuration maps the physical Logitech keyboard's Command keys to `Super` and Option keys to `Alt`, providing a macOS-like workflow under Sway.

### Kitty

- `⌘C` → copy
- `⌘V` → paste
- `Ctrl+C` → interrupt the running process
- `Ctrl+Z` → suspend the running process
- Selection automatically copies to the clipboard

### Other applications

- `⌘C` → `Ctrl+C`
- `⌘V` → `Ctrl+V`

## Requirements

The current configuration expects:

- Sway
- Kitty
- Zsh
- `wtype`
- `jq`
- Noctalia
- Nautilus
- Zen Browser
- `autotiling`

## Layout

```text
debian-sway-dotfiles/
├── kitty/
│   └── kitty.conf
├── scripts/
│   ├── mac-copy
│   ├── mac-paste
│   └── noctalia-watch
├── sway/
│   └── config
└── README.md
