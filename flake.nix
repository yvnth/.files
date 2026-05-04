{
  description = "yash2k4's NixOS config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = {
    home-manager,
    nix-flatpak,
    nixpkgs,
    self,
    sops-nix,
    spicetify-nix,
    stylix,
    ...
  } @ inputs: {
    nixosConfigurations.satella = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./hosts/satella/configuration.nix
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        {
          home-manager = {
            backupFileExtension = "bak";

            extraSpecialArgs = {
              inherit inputs;
            };

            useGlobalPkgs = true;
            useUserPackages = true;

            users.yash2k4 = {
              imports = [
                ./hosts/satella/home.nix
                inputs.sops-nix.homeManagerModules.sops
                spicetify-nix.homeManagerModules.default
              ];
            };
          };
        }
      ];
    };
  };
}
