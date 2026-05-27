{ self, inputs, config, lib, pkgs, ... }: {
  flake.nixosModules.nvidia = { config, lib, pkgs, ... }: {
    
    # Enable graphics (OpenGL)
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      # === HYBRID LAPTOP SPECIFIC SETTINGS ===
      prime = {
        # Enables Offload Mode
        offload = {
          enable = true;
          enableOffloadCmd = true; # Gives you the `nvidia-offload` terminal command
        };

        # YOU MUST FILL THESE IN (See instructions below)
        # Choose ONE of these depending on your CPU:
        intelBusId = "PCI:0:2:0"; # If you have an Intel CPU
        # amdgpuBusId = "PCI:0:0:0"; # If you have an AMD CPU
        
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}