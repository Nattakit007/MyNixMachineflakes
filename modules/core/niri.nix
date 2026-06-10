{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };

    environment.systemPackages = [ pkgs.nordzy-cursor-theme ];
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs; 
      v2-settings = true;

      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
        ];
        cursor = {
          xcursor-theme = "Nordzy-cursors";
          xcursor-size = 24; 
        };

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        input.keyboard.xkb.layout = "us,ua";
        input.keyboard.numlock = true;
        input.mouse.natural-scroll = false;
        input.touchpad.natural-scroll = false;
        input.mouse.accel-profile = "flat"; # Disables acceleration for precise, raw 1:1 input

        layout.gaps = 5;

        # === IMPORTS ===
        outputs = import ../../config/monitor.nix;
        binds = import ../../config/keybinds.nix { inherit pkgs lib self'; };
      };
    };
  };
}