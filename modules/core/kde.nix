{ self, inputs, ... }: {
  flake.nixosModules.kde = { pkgs, lib, ... }: {
    # === DISPLAY SERVERS & DE ===
    services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;

    # === INPUT CONFIGURATION ===
    # Matches your Niri layout and keyboard behaviors
    services.xserver.xkb.layout = "us,ua";
    
    services.libinput = {
      enable = true;
      # Disables acceleration for precise, raw 1:1 input
      mouse.accelProfile = "flat";
      # Natural scroll settings matching your input choices
      mouse.naturalScrolling = false;
      touchpad.naturalScrolling = false;
    };

    # Automatically set NumLock on at boot (SDDM/Plasma)
    services.displayManager.sddm.autoNumlock = true;

    # === SYSTEM PACKAGES ===
    environment.systemPackages = [ 
      pkgs.nordzy-cursor-theme 
    ];
  };
}