{ config, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file.".config/scripts".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/scripts/config";
}
