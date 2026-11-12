{ ... }: {
  imports = [
    ./base.nix
    ./gnome.nix
    ./hardware/apple-intel.nix
    ./hardware/nvidia.nix
  ];
}
