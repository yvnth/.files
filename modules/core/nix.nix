{
  lib,
  config,
  inputs,
  ...
}:
{
  options.modules.nix.enable = lib.mkEnableOption "nix";

  config = lib.mkIf config.modules.nix.enable {
    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };

      registry.nixpkgs.flake = inputs.nixpkgs;
      nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    };

    nixpkgs.config.allowUnfree = true;
  };
}
