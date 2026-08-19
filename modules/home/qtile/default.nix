{ lib, config, ... }:
{
  options.homeModules.qtile.enable = lib.mkEnableOption "qtile";

  config = lib.mkIf config.homeModules.qtile.enable {
    home.file.".config/qtile".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/qtile/config";
  };
}
