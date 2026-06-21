{
  description = "yvnth's NixOS config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/001e560fffc8f0235e9db20ebeb4ccde0ade1caf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

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

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      home-manager,
      lanzaboote,
      mangowm,
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
          mangowm.nixosModules.mango
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
