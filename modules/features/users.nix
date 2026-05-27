{ self, ... }: {
  flake.nixosModules.users = { pkgs, lib, ... }: {
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    users.users.kitanat = {
      isNormalUser = true;
      description = "kitanat";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };
}