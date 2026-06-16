{ config, pkgs, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    tmux
  ];

  home.file.".config/tmux".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/tmux/config";
}
