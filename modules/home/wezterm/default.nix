{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.wezterm.enable = lib.mkEnableOption "wezterm";

  config = lib.mkIf config.homeModules.wezterm.enable {
    home.packages = with pkgs; [
      wezterm
    ];

    home.file.".config/wezterm".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/wezterm/config";
  };
}
