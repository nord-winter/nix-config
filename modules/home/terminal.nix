{ config, lib, pkgs, inputs, ... }:
let
  cfg = config.custom.terminal.kitty;
in
{
  options.custom.terminal.kitty.enable = lib.mkEnableOption "kitty with the Black Textolite theme";

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 12;
      };
      settings = {
        background_opacity = "0.95";
        linux_display_server = "wayland";
        enable_audio_bell = "no";
        confirm_os_window_close = 0;
        window_padding_width = 20;
        cursor_shape = "beam";
        shell = "fish -l";
        tab_bar_style = "fade";
        active_tab_font_style = "bold";
        inactive_tab_font_style = "bold";
      };
      keybindings = {
        "ctrl+c" = "copy_or_interrupt";
        "ctrl+v" = "paste_from_clipboard";
        "ctrl+shift+c" = "send_text all \\x03";
      };
      extraConfig = builtins.readFile "${inputs.black-textolite}/kitty/black-textolite.conf";
    };
  };
}
