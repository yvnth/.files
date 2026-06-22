{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../../modules/core
  ];

  modules = {
    audio.enable = true;
    battery.enable = true;
    flatpak.enable = true;
    lanzaboote.enable = true;
    networking.enable = true;
    nix.enable = true;
    nvidia-intel.enable = true;
    services.enable = true;
    stylix.enable = true;
    virtualization.enable = true;
    zram.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  networking = {
    hostName = "satella";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.UTF-8";

  programs = {
    mango.enable = true;
    xwayland.enable = true;
    zsh.enable = true;
  };

  security.pam.services.swaylock = { };

  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      bigclock = "en";
      numlock = true;
    };
  };

  users.users.yvnth = {
    isNormalUser = true;
    description = "yvnth";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "docker"
      "libvirtd"
    ];
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  system.stateVersion = "25.11";
}
