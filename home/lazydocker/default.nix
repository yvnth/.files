{ config, pkgs, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    lazydocker
  ];

  home.file.".config/lazydocker".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/lazydocker/config";
}
