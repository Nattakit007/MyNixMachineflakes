{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs; 
      
      # Optional: Add this line to tell the wrapper you are using the new syntax
      v2-settings = true;

      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input.keyboard.xkb.layout = "us,ua";

        layout.gaps = 5;

        binds = {
          # --- Your Base Binds ---
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = _: {};
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";

          # --- Fullscreen ---
          "Mod+F".fullscreen-window = _: {};

          # --- Scroll through WORKSPACES with Mod + Mouse Wheel ---
          "Mod+WheelScrollDown".focus-workspace-down = _: {};
          "Mod+WheelScrollUp".focus-workspace-up = _: {};

          # --- Essential Niri Navigation (Keyboard) ---
          "Mod+Left".focus-column-left = _: {};
          "Mod+Right".focus-column-right = _: {};
          "Mod+Up".focus-window-up = _: {};
          "Mod+Down".focus-window-down = _: {};

          "Mod+Shift+Left".move-column-left = _: {};
          "Mod+Shift+Right".move-column-right = _: {};
          "Mod+Shift+Up".move-window-up = _: {};
          "Mod+Shift+Down".move-window-down = _: {};

          "Mod+C".center-column = _: {};

          # --- Workspaces (Keyboard Backup) ---
          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;

          "Mod+Shift+1".move-column-to-workspace = 1;
          "Mod+Shift+2".move-column-to-workspace = 2;
          "Mod+Shift+3".move-column-to-workspace = 3;
          "Mod+Shift+4".move-column-to-workspace = 4;

          # Safely exit Niri (Will now show a confirmation prompt)
          "Mod+Shift+E".quit = _: {};
        };
      };
    };
  };
}