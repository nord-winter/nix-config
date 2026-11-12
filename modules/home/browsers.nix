{ config, lib, pkgs, ... }:
let
  cfg = config.custom.browsers;
in
{
  options.custom.browsers = {
    brave.enable = lib.mkEnableOption "Brave";
    firefox.enable = lib.mkEnableOption "Firefox";
  };

  config = {
    home.packages =
      lib.optional cfg.brave.enable pkgs.brave
      ++ lib.optional cfg.firefox.enable pkgs.firefox;
  };
}
