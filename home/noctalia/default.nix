{ config, pkgs, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    noctalia-shell
  ];

  home.file.".config/noctalia".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/noctalia/config";
}
