{ pkgs, ... }: {
  # MacBook Air 1466 (Intel): Apple EFI, Intel iGPU, Apple клавиатура
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
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  services.thermald.enable = true;

  # WiFi (Broadcom): драйвер добавить после вывода lspci -nn на машине
}
