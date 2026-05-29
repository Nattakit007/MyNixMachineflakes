{ self, ... }: {
  flake.nixosModules.garbage-collector = { pkgs, lib, ... }: {
    
    # --- 1. Automatic Garbage Collection (The 7-Day Rule) ---
    nix.gc = {
      automatic = true;
      dates = "weekly"; # Runs once a week
      options = "--delete-older-than 7d"; 
    };

    # --- 2. Boot Menu Limit (The Keep 5 Rule) ---
    # Even if you rebuilt your system 20 times in the last 7 days, 
    # this ensures only the 5 most recent versions show up on the boot screen.
    boot.loader.limine.maxGenerations = 5;

    # --- 3. Auto-Optimize Store ---
    # This automatically finds identical files in the Nix store and 
    # symlinks them to save disk space. Highly recommended!
    nix.settings.auto-optimise-store = true;
  };
}
