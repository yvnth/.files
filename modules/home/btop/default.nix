{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.btop.enable = lib.mkEnableOption "btop";

  config = lib.mkIf config.homeModules.btop.enable {
    home.packages = with pkgs; [
      btop
    ];

    home.file.".config/btop".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/btop/config";
  };
}
