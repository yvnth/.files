{ lib, config, ... }:
{
  options.homeModules.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf config.homeModules.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "yvnth";
          email = "yvnth@users.noreply.github.com";
        };

        init.defaultBranch = "master";

        core.editor = "hx";
      };
    };
  };
}
