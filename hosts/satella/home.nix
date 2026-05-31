{ ... }:
{
  imports = [
    ./home-default.nix
  ];

  home = {
    username = "yvnth";
    homeDirectory = "/home/yvnth";

    stateVersion = "26.05";
  };
}
