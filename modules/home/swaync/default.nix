{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.homeModules.swaync.enable = lib.mkEnableOption "swaync";

  config = lib.mkIf config.homeModules.swaync.enable {
    home.packages = with pkgs; [
      swaynotificationcenter
    ];

    home.file.".config/swaync".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/swaync/config";
  };
}
