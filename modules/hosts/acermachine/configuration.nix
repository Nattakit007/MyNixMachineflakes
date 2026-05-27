{ self, inputs, ... }: {
  flake.nixosModules.myMachineConfiguration = { pkgs, lib, ... }: {
    imports = [
      # Features and Hardware
      self.nixosModules.acerHardware
      self.nixosModules.niri
      self.nixosModules.nvidia
      self.nixosModules.loginmanager

      # Core System Split-outs
      ../../../core/boot.nix
      ../../../core/localization.nix
      ../../../core/users.nix
      ../../../core/packages.nix
    ];

    system.stateVersion = "26.05";
  };
}