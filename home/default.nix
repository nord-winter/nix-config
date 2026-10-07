{ ... }: {
  imports = [ ../modules/home ];

  home = {
    username = "xvsim";
    homeDirectory = "/home/xvsim";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
