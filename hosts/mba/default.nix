{ ... }: {
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "25.05";

  custom = {
    base.enable = true;
    gnome.enable = true;
    hardware.appleIntel.enable = true;
  };
}
