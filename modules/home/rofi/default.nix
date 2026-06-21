{ lib, config, pkgs, ... }:
{
  options.homeModules.rofi.enable = lib.mkEnableOption "rofi";

  config = lib.mkIf config.homeModules.rofi.enable {
    home.packages = with pkgs; [
      rofi
    ];

    home.file.".config/rofi".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/modules/home/rofi/config";
  };
}
