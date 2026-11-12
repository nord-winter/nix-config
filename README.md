# nix-config

NixOS and home-manager configuration built on flake-parts. Multiple hosts, shared modules, and every feature toggled with an `enable` flag.

## Layout

```
flake.nix                                 entry point: inputs, systems
flake/hosts.nix                           host list
lib/mkHost.nix                            host factory: hostname + user -> NixOS system + home-manager
hosts/<name>/default.nix                  system config: hardware and enabled features
hosts/<name>/home.nix                     per-user settings for this host only
hosts/<name>/hardware-configuration.nix   generated on the machine by nixos-generate-config
home/default.nix                          user profile: features enabled for all hosts
modules/nixos/                            system modules, options under custom.*
modules/nixos/hardware/                   hardware modules: apple-intel, nvidia
modules/home/                             user modules, options under custom.*
```

The kitty theme lives in a separate repository, [black-textolite](https://github.com/nord-winter/black-textolite), and is pulled in as a flake input.

## Enabling a feature

System feature in `hosts/<name>/default.nix`:

```nix
custom.gnome.enable = true;
```

User feature in `home/default.nix` (all hosts) or `hosts/<name>/home.nix` (one host):

```nix
custom.browsers.firefox.enable = true;
```

## Adding a host

1. Create `hosts/<name>/default.nix` and `hosts/<name>/home.nix`.
2. Add `<name> = mkHost { hostname = "<name>"; user = "<login>"; };` to `flake/hosts.nix`.
3. On the machine, generate `hosts/<name>/hardware-configuration.nix` with `nixos-generate-config --show-hardware-config`.

## Adding a feature

Create a file in `modules/nixos/` or `modules/home/` that declares `options.custom.<name>.enable = lib.mkEnableOption "...";` and wraps its settings in `config = lib.mkIf cfg.enable { ... };`. Then add the file to the `imports` list in the folder's `default.nix`.

## Checks and builds

```
nix flake check
nix build .#nixosConfigurations.mba.config.system.build.toplevel
nixos-rebuild build-vm --flake .#mba
```

A virtual machine covers the logic. Mac-specific drivers (WiFi, bootloader) can only be verified on the hardware.

## Personal data

Git name and email are not stored in this repository. They live in `~/.config/git/local`, which is included through `programs.git.includes`.
