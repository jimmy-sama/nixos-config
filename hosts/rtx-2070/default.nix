{ config, pkgs, inputs, lib, ... }:

{
  imports =
    (import ../../modules/development/default.nix) ++
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

  system.stateVersion = "23.11"; # Did you read the comment?
}

