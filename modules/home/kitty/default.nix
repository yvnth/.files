{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.kitty.enable = lib.mkEnableOption "kitty";

  config = lib.mkIf config.homeModules.kitty.enable {
    home.packages = with pkgs; [
      kitty
    ];

    home.file.".config/kitty".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/kitty/config";
  };
}
