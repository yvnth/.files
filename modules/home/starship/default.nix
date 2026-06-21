{ lib, config, pkgs, ... }:
{
  options.homeModules.starship.enable = lib.mkEnableOption "starship";

  config = lib.mkIf config.homeModules.starship.enable {
    home.packages = with pkgs; [
      starship
    ];

    home.file.".config/starship".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/modules/home/starship/config";
  };
}
