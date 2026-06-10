{ self, ... }: {
  flake.nixosModules.pkgs-wayland = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kitty
      alacritty
      fuzzel
      # Keep xwayland-satellite here ONLY for Niri; KDE will ignore it
      xwayland-satellite 
      xdg-desktop-portal
    ];

    environment.variables = {
      QT_QPA_PLATFORM = "wayland;xcb"; # Fallback to XCB if a Wayland app misbehaves
      
      # REMOVED: QT_QPA_PLATFORMTHEME = "qt5ct"; 
      # Leaving this out allows Plasma to use its native configuration engine,
      # while standalone window managers can set it via Home Manager or local envs.
    };

    # Portals configuration
    xdg.portal = {
      enable = true;
      extraPortals = [ 
        pkgs.xdg-desktop-portal-gtk 
        # Note: pkgs.xdg-desktop-portal-kde is added automatically by services.desktopManager.plasma6.enable
      ];
      
      # Configure portals smartly based on the current desktop session
      config = {
        niri = {
          default = [ "gtk" ];
        };
        plasma = {
          default = [ "kde" ];
        };
        common = {
          default = [ "gtk" ]; # Global fallback
        };
      };
    };

    xdg.mime.enable = true;
  };
}