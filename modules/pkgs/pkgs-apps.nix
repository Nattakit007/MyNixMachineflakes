{ self, ... }: {
  flake.nixosModules.pkgs-apps = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      # Browsers & Media
      firefox
      discord
      vesktop
      vlc
      fastfetch
      spotify

      # Productivity & Creative Tools
      kdePackages.dolphin
      kdePackages.gwenview
      krita
      kdePackages.okular
      libreoffice-fresh
      unzip
    ];
  };
}