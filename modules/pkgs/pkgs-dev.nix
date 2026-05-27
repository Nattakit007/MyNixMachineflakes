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
    ];
  };
}