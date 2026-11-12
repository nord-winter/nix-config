# Name and email are not stored in this repo: they live in ~/.config/git/local
{ config, lib, ... }:
let
  cfg = config.custom.git;
in
{
  options.custom.git.enable = lib.mkEnableOption "git and aliases";

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      includes = [ { path = "~/.config/git/local"; } ];
      settings.init.defaultBranch = "main";
    };

    programs.fish.shellAbbrs = {
      gd = "git diff";
      ga = "git add .";
      gc = "git commit -m";
      gl = "git log";
      gs = "git status";
      gst = "git stash";
      gsp = "git stash pop";
      gp = "git push";
      gpl = "git pull";
      gsw = "git switch";
      gsm = "git switch main";
      gb = "git branch";
      gbd = "git branch -d";
      gsh = "git show";
    };
  };
}
