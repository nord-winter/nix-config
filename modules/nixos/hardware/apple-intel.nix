{ config, lib, pkgs, ... }:
let
  cfg = config.custom.hardware.appleIntel;
in
{
  options.custom.hardware.appleIntel.enable = lib.mkEnableOption "MacBook Air 1466 (Intel)";

  config = lib.mkIf cfg.enable {
    boot.loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        efiInstallAsRemovable = true;
      };
      efi.canTouchEfiVariables = false;
    };

    boot.extraModprobeConfig = ''
      options hid_apple fnmode=2
    '';

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [ intel-media-driver ];
    };

    services.thermald.enable = true;

    # WiFi: MacBook Air A1466 ships Broadcom BCM4360, which needs the proprietary wl driver
    boot.kernelModules = [ "wl" ];
    boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
    boot.blacklistedKernelModules = [ "b43" "bcma" "ssb" "brcmfmac" "brcmsmac" ];
    nixpkgs.config.allowInsecurePredicate =
      pkg: lib.hasPrefix "broadcom-sta" (lib.getName pkg);
  };
}
