{ ... }: {
  # kitty + собственная тема Gems Black Emerald
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
    extraConfig = builtins.readFile ./themes/gems-black-emerald.conf;
  };
}
