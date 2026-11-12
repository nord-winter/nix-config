{ config, lib, pkgs, ... }:
let
  cfg = config.custom.cliTools;
in
{
  options.custom.cliTools.enable = lib.mkEnableOption "CLI tools";

  config = lib.mkIf cfg.enable {
    programs = {
      bat.enable = true;
      zoxide.enable = true;
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
      lazygit.enable = true;
      fastfetch.enable = true;
    };

    home.packages = with pkgs; [ lsd ];
  };
}
