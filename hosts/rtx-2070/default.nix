{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/i3.nix
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    grub = {
     efiSupport = true;
     device = "nodev";
    };
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 20;
  };
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  networking.hostName = "Vermeer"; 

  # Enable networking
  networking.networkmanager.enable = true;

  # for Nvidia GPU
  services.xserver.videoDrivers = ["nvidia"];
  hardware.opengl.enable = true;
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
  };

  system.stateVersion = "23.11";
}

