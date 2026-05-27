{ self, inputs, ... }: {

  flake.nixosModules.myMachineConfiguration = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.nixosModules.acerHardware
      self.nixosModules.niri
      self.nixosModules.nvidia
      self.nixosModules.loginmanager
      
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos"; # Define your hostname.
  
    # Enable networking
    networking.networkmanager.enable = true;
  
    # Set your time zone.
    time.timeZone = "Asia/Bangkok";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
   };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.kitanat = {
      isNormalUser = true;
      description = "kitanat";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
   };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
     noto-fonts
     noto-fonts-cjk-sans
     noto-fonts-cjk-serif
     font-awesome
     ];
    
    system.stateVersion = "26.05";
  };

}
