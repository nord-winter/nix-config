{ pkgs, ... }: {
  # GNOME на Wayland через GDM
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Ввод: us + ru, переключение Ctrl+Space
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:ctrl_space_toggle";
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    epiphany
  ];

  environment.systemPackages = with pkgs; [
    adw-gtk3
  ];
}
