{ pkgs, ... }: {
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

  home.packages = with pkgs; [
    lsd
  ];
}
