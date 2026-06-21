{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.tmux.enable = lib.mkEnableOption "tmux";

  config = lib.mkIf config.homeModules.tmux.enable {
    home.packages = with pkgs; [
      tmux
    ];

    home.file.".config/tmux".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/tmux/config";
  };
}
