# ❄️ My NixOS + Niri Configuration

## 🌟 Highlights
- ❄️ **Flake-based:** Reproducible and declarative system configuration using Nix Flakes.
- 🪟 **Niri Compositor:** A modern Wayland setup featuring the scrollable-tiling Niri compositor.
- 🚀 **Ready to Go:** Integrated with Kitty (terminal), Noctalia (app launcher), and custom keybinds out of the box.
- 🎮 **Hardware Support:** Includes NVIDIA graphics configurations and optimized host setups (e.g., `acermachine`).
- 🎨 **Personalized:** Tailored theming and environment settings for a seamless desktop experience.

## ℹ️ Overview
This repository contains my personal NixOS configuration. It utilizes a Flake-based setup to ensure a reproducible, reliable, and version-controlled environment across my machines. The primary desktop experience is driven by [Niri](https://github.com/YaLTeR/niri), a scrollable-tiling Wayland compositor that offers a unique and highly productive workflow.

I created this project to centralize and streamline my system setups, avoiding the "works on my machine" problem. Whether you're a first-year Computer Science student exploring Linux or an experienced developer looking for Wayland and Niri dotfiles, you can inspect this codebase to see how a complete, customized Wayland desktop can be declaratively defined using NixOS. 

If you are interested in using or learning from this configuration, feel free to explore the modules and adapt them to your own needs!

## ⌨️ Niri Keybindings

The `Mod` key (usually the Windows/Super key) is used for all window management and system bindings.

### 🖥️ Applications & System
| Shortcut | Action |
| :--- | :--- |
| `Mod + Return` | Open Terminal (Kitty) |
| `Mod + S` | Toggle App Launcher (Noctalia) |
| `Mod + Shift + S` | Interactive Screenshot (Select Area/Window) |
| `Print` | Full Screen Screenshot |
| `Mod + Shift + E` | Quit Niri (Logout to SDDM) |

### 🪟 Window Management
| Shortcut | Action |
| :--- | :--- |
| `Mod + Q` | Close Window |
| `Mod + F` | Maximize Column (Stretch to fit screen) |
| `Mod + V` | Toggle Floating Window |
| `Mod + C` | Center Current Column |
| `Mod + Shift + Left / Right` | Move column left/right |
| `Mod + Shift + Up / Down` | Move window up/down (within the same column) |

### 🧭 Navigation
| Shortcut | Action |
| :--- | :--- |
| `Mod + Left / Right` | Focus left/right column |
| `Mod + Up / Down` | Focus up/down window |

### 📁 Workspaces
| Shortcut | Action |
| :--- | :--- |
| `Mod + Mouse Wheel` | Scroll up/down through workspaces |
| `Mod + 1, 2, 3, 4` | Jump to Workspace 1-4 |
| `Mod + Shift + 1, 2, 3, 4` | Move active column to Workspace 1-4 |
