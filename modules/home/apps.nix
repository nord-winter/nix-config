{ config, lib, pkgs, ... }:
let
  cfg = config.custom.apps;
in
{
  options.custom.apps = {
    media.enable = lib.mkEnableOption "mpv media player";
    chat.enable = lib.mkEnableOption "Telegram Desktop";
    obs.enable = lib.mkEnableOption "OBS Studio";
  };

  config = {
    home.packages =
      lib.optional cfg.media.enable pkgs.mpv
      ++ lib.optional cfg.chat.enable pkgs.telegram-desktop
      ++ lib.optional cfg.obs.enable pkgs.obs-studio;
  };
}
