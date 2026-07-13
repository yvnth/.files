{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.homeModules.swaylock.enable = lib.mkEnableOption "swaylock";

  config = lib.mkIf config.homeModules.swaylock.enable {
    home.packages = with pkgs; [
      swaylock
    ];

    home.file.".config/swaylock".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/swaylock/config";
  };
}
