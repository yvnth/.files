{ lib, config, pkgs, ... }:
{
  options.modules.nvidia-intel.enable = lib.mkEnableOption "nvidia-intel";

  config = lib.mkIf config.modules.nvidia-intel.enable {
    boot = {
      initrd.kernelModules = [
        "nvidia"
        "nvidia_drm"
        "nvidia_modeset"
        "nvidia_uvm"
      ];
      kernelPackages = pkgs.linuxPackages_latest;
      kernelParams = [
        "nvidia-drm.modeset=1"
        "nvidia-drm.fbdev=1"
      ];
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      LIBVA_DRIVER_NAME = "iHD";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
    };

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          intel-media-driver
          intel-compute-runtime
        ];
      };
      nvidia = {
        modesetting.enable = true;
        nvidiaPersistenced = false;
        nvidiaSettings = true;
        open = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        powerManagement = {
          enable = true;
          finegrained = true;
        };
        prime = {
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
        };
      };
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
