{ self, inputs, ... }: {
  flake.nixosModules.myMachineConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.acerHardware
      self.nixosModules.nvidia
      self.nixosModules.niri
      self.nixosModules.kde
      self.nixosModules.loginmanager
      self.nixosModules.boot
      self.nixosModules.localization
      self.nixosModules.users
      self.nixosModules.garbage-collector
      self.nixosModules.pkgs-dev
      self.nixosModules.pkgs-wayland
      self.nixosModules.pkgs-apps
      self.nixosModules.fonts
      self.
    ];

    system.stateVersion = "26.05";
  };
}