{ config, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file.".config/mango".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/mango/config";
}
