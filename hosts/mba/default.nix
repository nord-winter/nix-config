{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/base.nix
    ../../modules/nixos/gnome.nix
    ../../modules/nixos/apple-intel.nix
  ];

  networking.hostName = "mba";
  system.stateVersion = "25.05";
}
