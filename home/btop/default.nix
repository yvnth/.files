{ config, pkgs, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    btop
  ];

  home.file.".config/btop".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/btop/config";
}
