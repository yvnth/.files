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
    fastfetch.enable = true;
    git.enable = true;
    java.enable = true;
    kitty.enable = true;
    lazydocker.enable = true;
    lazygit.enable = true;
    mako.enable = true;
    nix-search.enable = true;
    qtile.enable = true;
    rofi.enable = true;
    shell.enable = true;
    spicetify.enable = true;
    starship.enable = true;
    swaylock.enable = true;
    tmux.enable = true;
    vesktop.enable = true;
    wezterm.enable = true;
    yazi.enable = true;
    zathura.enable = true;
  };
}
