{ system, self, nixpkgs, inputs, user, ... }:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{
  rtx-2070 = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [
      ./rtx-2070/i3
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.impermanence.nixosModules.impermanence
      inputs.nur.nixosModules.nur
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [
        	(import ./laptop/i3/home.nix)
            ]; 
          };
        };
      }
    ];
  };
  thinkpad-e495 = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [
      ./thinkpad-e495
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.impermanence.nixosModules.impermanence
    ];
  };

}
