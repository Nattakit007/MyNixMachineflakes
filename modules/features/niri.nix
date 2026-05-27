{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs; # THIS PART IS VERY IMPORTAINT, I FORGOT IT IN THE VIDEO!!!
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input.keyboard.xkb.layout = "us,ua";

        layout.gaps = 5;

        binds = {
          # --- Your Existing Binds ---
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = null;
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";

          # --- New: Fullscreen ---
          "Mod+F".fullscreen-window = null;

          # --- New: Scroll through windows with Mod + Mouse Wheel ---
          # Niri's defining feature is horizontal columns. Scrolling moves you left/right.
          "Mod+WheelScrollDown".focus-column-right = null;
          "Mod+WheelScrollUp".focus-column-left = null;

          # --- Essential Niri Navigation (Keyboard) ---
          # Move your focus between windows
          "Mod+Left".focus-column-left = null;
          "Mod+Right".focus-column-right = null;
          "Mod+Up".focus-window-up = null;
          "Mod+Down".focus-window-down = null;

          # Move the actual windows around the screen
          "Mod+Shift+Left".move-column-left = null;
          "Mod+Shift+Right".move-column-right = null;
          "Mod+Shift+Up".move-window-up = null;
          "Mod+Shift+Down".move-window-down = null;

          # Center the current column on the screen (Very useful in Niri!)
          "Mod+C".center-column = null;

          # --- Workspaces ---
          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;

          # Move active window to a specific workspace
          "Mod+Shift+1".move-column-to-workspace = 1;
          "Mod+Shift+2".move-column-to-workspace = 2;
          "Mod+Shift+3".move-column-to-workspace = 3;
          "Mod+Shift+4".move-column-to-workspace = 4;

          # Safely exit Niri (Logs you out to SDDM)
          "Mod+Shift+E".quit = { skip-confirmation = true; };
        };
      };
    };
  };
}