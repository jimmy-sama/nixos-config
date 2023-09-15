{
  description = "NixOS configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.nixos.org/"
    ];

    # nix community's cache server
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";      
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
  }: {
    nixosConfigurations = {
      nixos-workstation = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        #  config: The configuration of the entire system
        #  options: All option declarations refined with all definition and declaration references.
        #  pkgs: The attribute set extracted from the Nix package collection and enhanced with the nixpkgs.config option.
        #  modulesPath: The location of the module directory of NixOS.
    
        modules = [
          ./hosts/nixos-workstation

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.aurelius = import ./home;
          }
        ];
      };

      nixos-homestation = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/nixos-homestation

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
