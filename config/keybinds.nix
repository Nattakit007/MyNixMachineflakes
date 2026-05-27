# config/keybinds.nix
{ pkgs, lib, self', ... }: {
  # --- Applications ---
  "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
  "Mod+Q".close-window = _: {};
  "Mod+Shift+S".screenshot = _: {};         # Interactive area screenshot
  "Print".screenshot-screen = _: {};        # (Optional) Full screen screenshot
  "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";

  # --- Window & Column Management ---
  "Mod+F".maximize-column = _: {};          # Changed: Stretches column to fit the screen instead of full fullscreen
  "Mod+V".toggle-window-floating = _: {};   # New: Toggles the active window between tiled and floating states
  "Mod+C".center-column = _: {};

  "Mod+Shift+Left".move-column-left = _: {};
  "Mod+Shift+Right".move-column-right = _: {};
  "Mod+Shift+Up".move-window-up = _: {};
  "Mod+Shift+Down".move-window-down = _: {};

  # --- Navigation ---
  "Mod+WheelScrollDown".focus-column-right = _: {};
  "Mod+WheelScrollUp".focus-column-left = _: {};

  "Mod+Left".focus-column-left = _: {};
  "Mod+Right".focus-column-right = _: {};
  "Mod+Up".focus-window-up = _: {};
  "Mod+Down".focus-window-down = _: {};

  # --- Workspaces ---
  "Mod+1".focus-workspace = 1;
  "Mod+2".focus-workspace = 2;
  "Mod+3".focus-workspace = 3;
  "Mod+4".focus-workspace = 4;

  "Mod+Shift+1".move-column-to-workspace = 1;
  "Mod+Shift+2".move-column-to-workspace = 2;
  "Mod+Shift+3".move-column-to-workspace = 3;
  "Mod+Shift+4".move-column-to-workspace = 4;

  # --- System ---
  "Mod+Shift+E".quit = _: {};
}