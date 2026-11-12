{ inputs }:
{ hostname, user }:
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs user; };
  modules = [
    (../hosts + "/${hostname}/default.nix")
    ../modules/nixos/default.nix
    inputs.home-manager.nixosModules.home-manager
    {
      networking.hostName = hostname;

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "hm-backup";
        extraSpecialArgs = { inherit inputs user; };
        users.${user}.imports = [
          ../home/default.nix
          (../hosts + "/${hostname}/home.nix")
        ];
      };
    }
  ];
}
