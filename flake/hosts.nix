{ inputs, ... }:
let
  mkHost = import ../lib/mkHost.nix { inherit inputs; };
in
{
  flake.nixosConfigurations = {
    mba = mkHost {
      hostname = "mba";
      user = "nord-winter";
    };
  };
}
