{ config, pkgs, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    rofi
  ];

  home.file.".config/rofi".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/rofi/config";
}
