{
  description = "unga bunga";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nixcord.url = "github:kaylorben/nixcord";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/pc

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.ethan = import ./home/home.nix;
          
            home-manager.sharedModules = [
              inputs.nixcord.homeModules.nixcord
            ];
          }
        ];
      };
    };
  };
}