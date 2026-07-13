{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.helix.enable = lib.mkEnableOption "helix";

  config = lib.mkIf config.homeModules.helix.enable {
    home.packages = with pkgs; [
      bash-language-server
      clang-tools
      docker-compose-language-service
      dockerfile-language-server
      gopls
      helm-ls
      jdt-language-server
      jq-lsp
      just-formatter
      just-lsp
      kdePackages.qtdeclarative
      lua-language-server
      lldb
      marksman
      mesonlsp
      nixd
      nixfmt
      ols
      omnisharp-roslyn
      phpactor
      python3Packages.python-lsp-server
      ruby-lsp
      ruff
      rust-analyzer
      taplo
      tinymist
      tombi
      typescript-language-server
      vscode-langservers-extracted
      yaml-language-server
      zls
    ];

    home.file.".config/helix".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/helix/config";
  };
}
