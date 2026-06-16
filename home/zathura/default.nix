{ config, pkgs, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    zathura
  ];

  home.file.".config/zathura".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/zathura/config";
}
