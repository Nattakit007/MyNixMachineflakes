# niri.nix
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
      v2-settings = true;

      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
        ];


        

        cursor = {
          xcursor-theme = "SamToki-BTR"; 
          xcursor-size = 24; 
        };

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        input.keyboard.xkb.layout = "us,ua";
        input.keyboard.numlock = true;
        layout.gaps = 5;

        # === IMPORTS ===
        outputs = import ../../config/monitor.nix;
        binds = import ../../config/keybinds.nix { inherit pkgs lib self'; };
      };
    };
  };
}