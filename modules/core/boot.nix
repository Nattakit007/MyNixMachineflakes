{ self, ... }: {
  flake.nixosModules.boot = { pkgs, lib, ... }: {
    boot.loader.systemd-boot.enable = false;
    
    boot.loader.limine = {
        enable = true;
        style = {
          wallpapers = [
          "${pkgs.nixos-artwork.wallpapers.nineish-dark-gray}/share/backgrounds/nixos/nix-wallpaper-nineish-dark-gray.png"];
          graphicalTerminal.background = "80000000";
          interface.branding = "Nix Limine";
          interface.brandingColor = "c4a7e7";
          };
      };
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
