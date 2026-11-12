{ config, lib, ... }:
let
  cfg = config.custom.hardware.nvidia;
in
{
  options.custom.hardware.nvidia.enable = lib.mkEnableOption "NVIDIA driver (open kernel module)";

  config = lib.mkIf cfg.enable {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };
}
