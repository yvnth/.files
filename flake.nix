{
  description = "yvnth's NixOS config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

  outputs =
    {
      home-manager,
      lanzaboote,
      nix-flatpak,
      nixpkgs,
      spicetify-nix,
      stylix,
      ...
    }@inputs:
    {
      nixosConfigurations.satella = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hosts/satella/configuration.nix
          lanzaboote.nixosModules.lanzaboote
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
              users.yvnth = {
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
