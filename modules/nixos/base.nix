{ pkgs, ... }: {
  # Nix: flakes и чистый store
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.xvsim = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
  ];
}
