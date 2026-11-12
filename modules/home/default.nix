{ ... }: {
  imports = [
    ./shell.nix
    ./git.nix
    ./cli-tools.nix
    ./terminal.nix
    ./browsers.nix
    ./editors.nix
    ./dev.nix
    ./apps.nix
  ];
}
