{ lib, config, pkgs, ... }:
{
  options.homeModules.noctalia.enable = lib.mkEnableOption "noctalia";

  config = lib.mkIf config.homeModules.noctalia.enable {
    home.packages = with pkgs; [
      noctalia-shell
    ];

    home.file.".config/noctalia".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/modules/home/noctalia/config";
  };
}
