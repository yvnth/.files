{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.nix-search.enable = lib.mkEnableOption "nix-search";

  config = lib.mkIf config.homeModules.nix-search.enable {
    home.packages = with pkgs; [
      (writeShellApplication {
        name = "ns";
        runtimeInputs = [
          fzf
          nix-search-tv
        ];
        text = builtins.readFile "${nix-search-tv.src}/nixpkgs.sh";
      })
    ];
  };
}
