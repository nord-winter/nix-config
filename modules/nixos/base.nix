{ config, lib, pkgs, user, ... }:
let
  cfg = config.custom.base;
in
{
  options.custom.base.enable = lib.mkEnableOption "base system settings";

  config = lib.mkIf cfg.enable {
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

    time.timeZone = lib.mkDefault "Asia/Bangkok";
    i18n.defaultLocale = "en_US.UTF-8";

    users.users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" ];
      shell = pkgs.fish;
    };
    programs.fish.enable = true;

    networking.networkmanager.enable = true;

    zramSwap.enable = true;

    environment.systemPackages = with pkgs; [
      git
      wget
      curl
    ];
  };
}
