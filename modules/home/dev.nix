{ config, lib, pkgs, ... }:
let
  cfg = config.custom.dev;
in
{
  options.custom.dev.enable = lib.mkEnableOption "development tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gh
    ];
  };
}
