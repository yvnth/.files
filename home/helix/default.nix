{ config, pkgs, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    bash-language-server
    clang-tools
    docker-compose-language-service
    dockerfile-language-server
    gopls
    helix
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
    mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/helix/config";
}
