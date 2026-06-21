{ lib, config, pkgs, ... }:
{
  options.homeModules.yazi.enable = lib.mkEnableOption "yazi";

  config = lib.mkIf config.homeModules.yazi.enable {
    home.packages = with pkgs; [
      yazi
    ];

    home.file.".config/yazi".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/modules/home/yazi/config";
  };
}
