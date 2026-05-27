{ pkgs, lib, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    kitty
    alacritty
    firefox
    git
    gcc
    fuzzel
    xwayland-satellite
    xdg-desktop-portal
    vscode
    discord
    vesktop
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    font-awesome
  ];
}