{ config, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file.".config/shell".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/shell/config";

  home.file.".bashrc".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/shell/config/.bashrc";

  home.file.".zshrc".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/shell/config/.zshrc";
}
