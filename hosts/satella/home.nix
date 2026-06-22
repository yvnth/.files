{ ... }:
{
  imports = [ ../../modules/home ];

  home = {
    username = "yvnth";
    homeDirectory = "/home/yvnth";
    stateVersion = "25.11";
  };

  homeModules = {
    btop.enable = true;
    git.enable = true;
    helix.enable = true;
    java.enable = true;
    kitty.enable = true;
    lazydocker.enable = true;
    lazygit.enable = true;
    mango.enable = true;
    nix-search.enable = true;
    rofi.enable = true;
    shell.enable = true;
    sops.enable = true;
    spicetify.enable = true;
    starship.enable = true;
    swaylock.enable = true;
    swaync.enable = true;
    tmux.enable = true;
    vesktop.enable = true;
    waybar.enable = true;
    yazi.enable = true;
    zathura.enable = true;
  };
}
