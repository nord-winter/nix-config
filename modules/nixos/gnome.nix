{ config, lib, pkgs, ... }:
let
  cfg = config.custom.gnome;
in
{
  options.custom.gnome.enable = lib.mkEnableOption "GNOME on Wayland";

  config = lib.mkIf cfg.enable {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.xserver.xkb = {
      layout = "us,ru";
      options = "grp:ctrl_space_toggle";
    };

    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      epiphany
    ];

    environment.systemPackages = with pkgs; [
      adw-gtk3
      dconf-editor
      gnome-tweaks
    ];
  };
}
