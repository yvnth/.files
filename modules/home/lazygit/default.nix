{ lib, config, pkgs, ... }:
{
  options.homeModules.lazygit.enable = lib.mkEnableOption "lazygit";

  config = lib.mkIf config.homeModules.lazygit.enable {
    home.packages = with pkgs; [
      lazygit
    ];

    home.file.".config/lazygit".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/modules/home/lazygit/config";
  };
}
