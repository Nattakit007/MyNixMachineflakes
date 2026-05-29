{ self, ... }: {
  flake.nixosModules.pkgs-dev = { pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      neovim
      wget
      git
      gcc
      vscode
      jetbrains.clion
      cmake
      gnumake
      stm32cubemx
      arduino-ide
      gcc-arm-embedded
      openocd
      stlink
    ];

    services.udev.packages = [
      pkgs.stlink
      pkgs.openocd
    

    ];
  };
}
