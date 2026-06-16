{ config, pkgs, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    lazygit
  ];

  home.file.".config/lazygit".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/lazygit/config";
}
