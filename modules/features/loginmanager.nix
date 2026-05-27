{ self, inputs, ... }: {
  flake.nixosModules.loginmanager = { config, lib, pkgs, ... }: {
    
    # 1. Import the module from your flake inputs
    imports = [ inputs.silentSDDM.nixosModules.default ];
    
    # 2. Standard SDDM setup (Keep Wayland enabled for Niri)
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true; 
      # REMOVED: theme = "rei";
    };

    # 3. The specific SilentSDDM module configuration
    programs.silentSDDM = {
      enable = true;
      theme = "rei";
    };

    # 4. Clean up old packages
    environment.systemPackages = with pkgs; [
      # Removed sddm-astronaut here. SilentSDDM installs itself automatically.
    ];
  };
}