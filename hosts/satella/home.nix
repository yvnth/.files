{ ... }:
{
  imports = [
    ../../home/dots.nix
    ../../home/programs/git.nix
    ../../home/programs/java.nix
    ../../home/programs/nix-search.nix
    ../../home/programs/sops.nix
    ../../home/programs/spicetify.nix
    ../../home/programs/vesktop.nix
  ];

  home = {
    username = "yvnth";
    homeDirectory = "/home/yvnth";

    stateVersion = "26.05";
  };
}
