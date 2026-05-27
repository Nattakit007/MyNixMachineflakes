{ self, ... }: {
  flake.nixosModules.pkgs-wayland = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kitty
      alacritty
      fuzzel
      xwayland-satellite
      xdg-desktop-portal
    ];

    environment.variables = {
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };
}