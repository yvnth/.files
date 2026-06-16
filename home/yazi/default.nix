{ config, pkgs, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    yazi
  ];

  home.file.".config/yazi".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/yazi/config";
}
