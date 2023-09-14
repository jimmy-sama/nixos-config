# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports =
    [ 
      ./modules/i3.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    efiSupport = false;
    useOSProber = true;
  };

  # Networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    wireless.enable = false;
    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    firewall.enable = false;
    enableIPv6 = false;
    # Proxy Settings
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services = {
    xserver.enable = true;
    xserver.layout = "de";
  };

  console.keyMap = "de";

  # Add user 'aurelius'
  users.users.aurelius = {
    isNormalUser = true;
    description = "Marcus Aurelius";
    extraGroups = [ "networkmanager" "wheel" ];
    # openssh.authorizedKeys.keys = [
    #     # Replace with your own public key
    #     "ssh-ed25519 <some-public-key> user@pc"
    # ];
    packages = with pkgs; [
      firefox
      thunderbird
    ];
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
  git
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
  tldr
  trash-cli
  unzip
  xclip
  # HTB recommendations
  netcat
  nmap
  wireshark
  tcpdump
  hashcat
  ffuf
  gobuster
  thc-hydra
  proxychains
  sqlmap
  radare2
  metasploit
  python3
  theharvester
  remmina
  freerdp
  rdesktop
  crackmapexec
  exiftool
  curl
  testssl
  neovim
  tmux
  ];
  # Set default editor to neovim
  environment.variables.EDITOR = "nvim";

  # Fonts
  fonts = {
    # use fonts specified by user rather than default ones
    fontDir.enable = true;

    fonts = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      # nerdfonts
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];
  };

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

