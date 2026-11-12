{ user, ... }: {
  imports = [ ../modules/home/default.nix ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;

  custom = {
    shell.enable = true;
    git.enable = true;
    cliTools.enable = true;
    terminal.kitty.enable = true;
    browsers.brave.enable = true;
    editors.zed.enable = true;
    dev.enable = true;
  };
}
