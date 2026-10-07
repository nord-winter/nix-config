{ ... }: {
  programs.git = {
    enable = true;
    # Имя и email задать здесь или в ~/.config/git/local
    includes = [ { path = "~/.config/git/local"; } ];
    extraConfig.init.defaultBranch = "main";
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
}
