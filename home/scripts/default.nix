{ config, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file.".config/scripts".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/scripts/config";
}
