{ pkgs, ... }: {
  # fish + плагины Fisher-набора
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "lsd --group-dirs first";
      cat = "bat --style=plain --paging=never";
    };

    shellAbbrs = {
      l = "ls";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      lg = "lazygit";
    };

    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      { name = "fzf.fish"; src = pkgs.fishPlugins.fzf-fish.src; }
      { name = "autopair.fish"; src = pkgs.fishPlugins.autopair.src; }
      { name = "puffer-fish"; src = pkgs.fishPlugins.puffer.src; }
      { name = "nvm.fish"; src = pkgs.fishPlugins.nvm.src; }
    ];

    interactiveShellInit = ''
      fish_add_path ~/.local/bin
    '';
  };
}
