{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/i3.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    grub = {
     efiSupport = true;
     #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
     device = "nodev";
    };
    systemd-boot.enable = true;
  };

  networking.hostName = "Vermeer"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # for Nvidia GPU
  services.xserver.videoDrivers = ["nvidia"];
  hardware.opengl.enable = true;
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}


