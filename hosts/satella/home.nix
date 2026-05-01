{...}: {
  imports = [
    ../../home/dots.nix
    ../../home/programs/git.nix
    ../../home/programs/nix-search.nix
    ../../home/programs/noctalia.nix
    ../../home/programs/sops.nix
    ../../home/programs/spicetify.nix
    ../../home/programs/vesktop.nix
  ];

  home = {
    username = "yash2k4";
    homeDirectory = "/home/yash2k4";

    stateVersion = "26.05";
  };
}
