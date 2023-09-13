# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, helix, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-workstation"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Add user 'aurelius'
  users.users.aurelius = {
    isNormalUser = true;
    description = "aurelius";
    extraGroups = [ "networkmanager" "wheel" ];
    # openssh.authorizedKeys.keys = [
    #     # Replace with your own public key
    #     "ssh-ed25519 <some-public-key> ryan@ryan-pc"
    # ];
    packages = with pkgs; [
      firefox
      thunderbird
    ];
    nix.settings.trusted-users = [ "aurelius" ];
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no"; # disable root login
      PasswordAuthentication = false; # disable password login
    };
    openFirewall = true;
  };

  # Enable Flakes and the new command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
	zsh
  wget
  neofetch
	starship
	brave
	eww
	flameshot
	gcc
	gparted
	kitty
	openssl
	qemu
	terminus-nerdfont
	tldr
	trash-cli
	unzip
	xclip
  # HTB recommendations
  netcat
  ncat
  nmap
  wireshark
  tcpdump
  hashcat
  ffuf
  gobuster
  hydra
  zaproxy
  proxychains
  sqlmap
  radare2
  metasploit-framework
  python3
  spiderfoot
  theharvester
  remmina
  xfreerdp
  rdesktop
  crackmapexec
  exiftool
  curl
  seclists
  testssl.sh
  git
  neovim
  tmux

  # Install Helix from the `helix` input
  helix.packages."${pkgs.system}".helix
  ];
  # Set default editor to neovim
  environment.variables.EDITOR = "nvim";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  networking.enableIPv6 = false;

  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      (nerdfonts.override { fonts = [ "Meslo" ]; })
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
	      monospace = [ "Meslo LG M Regular Nerd Font Complete Mono" ];
	      serif = [ "Noto Serif" "Source Han Serif" ];
	      sansSerif = [ "Noto Sans" "Source Han Sans" ];
      };
    };
  };
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;
  system.autoUpgrade.enable = false;  
  system.autoUpgrade.allowReboot = false; 
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-23.05";
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

