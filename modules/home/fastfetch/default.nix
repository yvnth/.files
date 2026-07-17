{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.homeModules.fastfetch.enable = lib.mkEnableOption "fastfetch";

  config = lib.mkIf config.homeModules.fastfetch.enable {
    home.packages = with pkgs; [
      fastfetch
    ];

    home.file.".config/fastfetch".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/fastfetch/config";
  };
}
