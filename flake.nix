{
  description = "NixOS configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.nixos.org/"
    ];
  };

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";      
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    update-systemd-resolved.url = "github:jonathanio/update-systemd-resolved";
    update-systemd-resolved.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
      self,
      nixpkgs,
      home-manager,
      update-systemd-resolved,
      ...
  }: {
    nixosConfigurations = {
      rtx-2070 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/rtx-2070
          update-systemd-resolved.nixosModules.update-systemd-resolved
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.aurelius = import ./home;
          }
        ];
      };
    };
  };
}
