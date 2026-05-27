{self, inputs, ...}: {
    flake.nixosModules.acerHardware = {config, lib, pkgs, modulesPath, ... }: {
    imports = [ 
        (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = { 
        device = "/dev/disk/by-uuid/a834d026-3784-4832-9294-741e43582613";
        fsType = "ext4";
    };

  fileSystems."/boot" = { 
        device = "/dev/disk/by-uuid/1F24-006E";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ { 
        device = "/dev/disk/by-uuid/a4d59da1-dc07-4be4-918a-8d4ffd76585a"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}