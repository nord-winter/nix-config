{ lib, ... }: {
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "25.05";

  custom = {
    base.enable = true;
    gnome.enable = true;
    hardware.appleIntel.enable = true;
  };

  # Temporary: system runs from a 14.5 GB USB stick until the NVMe SSD arrives.
  # Fewer writes and less disk usage. Remove the block after moving to NVMe.
  fileSystems."/".options = [ "noatime" ];
  boot.loader.grub.configurationLimit = 3;
  documentation.enable = false;
  nix.gc.options = lib.mkForce "--delete-older-than 3d";
}
