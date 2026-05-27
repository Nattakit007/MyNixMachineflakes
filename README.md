# My NixOS + Niri Configuration

This repository contains my NixOS configuration, utilizing a Flake-based setup with the Niri Wayland compositor.

## Niri Keybindings

The `Mod` key (usually the Windows/Super key) is used for all window management and system bindings.

###  Applications & System
| Shortcut | Action |
| :--- | :--- |
| `Mod + Return` | Open Terminal (Kitty) |
| `Mod + S` | Toggle App Launcher (Noctalia) |
| `Mod + Shift + E` | Quit Niri (Logout to SDDM) |

###  Window Management
| Shortcut | Action |
| :--- | :--- |
| `Mod + Q` | Close Window |
| `Mod + F` | Toggle Fullscreen |
| `Mod + C` | Center Current Column |
| `Mod + Shift + Left / Right` | Move window left/right (creates/moves columns) |
| `Mod + Shift + Up / Down` | Move window up/down (within the same column) |

###  Navigation
| Shortcut | Action |
| :--- | :--- |
| `Mod + Left / Right` | Focus left/right column |
| `Mod + Up / Down` | Focus up/down window |

###  Workspaces
| Shortcut | Action |
| :--- | :--- |
| `Mod + Mouse Wheel` | Scroll up/down through workspaces |
| `Mod + 1, 2, 3, 4` | Jump to Workspace 1-4 |
| `Mod + Shift + 1, 2, 3, 4` | Move active window to Workspace 1-4 |