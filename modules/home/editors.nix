{ config, lib, pkgs, ... }:
let
  cfg = config.custom.editors;
in
{
  options.custom.editors = {
    zed.enable = lib.mkEnableOption "Zed";
    vscode.enable = lib.mkEnableOption "VS Code";
  };

  config = {
    home.packages =
      lib.optional cfg.zed.enable pkgs.zed-editor
      ++ lib.optional cfg.vscode.enable pkgs.vscode;
  };
}
