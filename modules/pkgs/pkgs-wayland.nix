{ self, ... }: {
  flake.nixosModules.pkgs-wayland = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kitty
      alacritty
      fuzzel
      xwayland-satellite
      xdg-desktop-portal
      xdg-desktop-portal-gtk
    ];

    environment.variables = {
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };

    #portals
    xdg.portal = {
      enable = true;
      # We use gtk as the portal because it provides the most compatible 
      # file picker and interaction for most apps
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };

    xdg.mime.enable = true;

  };
}
