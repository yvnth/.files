{ config, pkgs, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    kitty
  ];

  home.file.".config/kitty".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/kitty/config";
}
