{ self, inputs, ... }: {
  flake.nixosModules.loginmanager = { config, lib, pkgs, ... }: {
    imports = [inputs.silentSDDM.nixosModules.default];
    # Enable the SDDM Display Manager
    services.displayManager.sddm = {
      enable = true;
      
      # Crucial for Niri: Runs the login screen natively on Wayland 
      # instead of relying on legacy X11 components.
      wayland.enable = true; 
      
      # This exact string must match the folder name inside the theme package
      theme = "rei"; 
    };

    # You must install the theme package so SDDM can find the assets
    environment.systemPackages = with pkgs; [
      sddm-astronaut
      
      # If you ever want to switch themes, just swap the package above
      # and update the `theme = "..."` string. Some other great ones:
      # catppuccin-sddm
      # where-is-my-sddm-theme
      # sddm-chili-theme
    ];
  };
}