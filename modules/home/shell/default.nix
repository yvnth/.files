{ lib, config, ... }:
{
  options.homeModules.shell.enable = lib.mkEnableOption "shell";

  config = lib.mkIf config.homeModules.shell.enable {
    home.file.".config/shell".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/shell/config";

    home.file.".bashrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/shell/config/.bashrc";

    home.file.".zshrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/shell/config/.zshrc";
  };
}
