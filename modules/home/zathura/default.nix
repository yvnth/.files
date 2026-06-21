{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.zathura.enable = lib.mkEnableOption "zathura";

  config = lib.mkIf config.homeModules.zathura.enable {
    home.packages = with pkgs; [
      zathura
    ];

    home.file.".config/zathura".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/zathura/config";
  };
}
