{ pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../../modules/audio.nix
    ../../modules/battery.nix
    ../../modules/flatpak.nix
    ../../modules/networking.nix
    ../../modules/nvidia-intel.nix
    ../../modules/services.nix
    ../../modules/stylix.nix
    ../../modules/virtualization.nix
  ];

  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    efi.canTouchEfiVariables = true;
  };

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
    autoGenerateKeys.enable = true;
    autoEnrollKeys.enable = true;
  };

  environment.systemPackages = [ pkgs.sbctl ];

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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    sway = {
      enable = true;
      extraOptions = [ "--unsupported-gpu" ];
      package = pkgs.swayfx;
    };
    xwayland.enable = true;
    zsh.enable = true;
  };

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

  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 50;
    priority = 100;
  };

  system.stateVersion = "25.11";
}
