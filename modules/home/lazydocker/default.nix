{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.lazydocker.enable = lib.mkEnableOption "lazydocker";

  config = lib.mkIf config.homeModules.lazydocker.enable {
    home.packages = with pkgs; [
      lazydocker
    ];

    home.file.".config/lazydocker".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/lazydocker/config";
  };
}
