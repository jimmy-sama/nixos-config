{ config, pkgs, ... }:

{
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

  # Enable CUPS to print documents.
  services.printing.enable = true;


  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons
      # normal fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      # nerdfonts
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];
    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;
    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
  programs.dconf.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  networking.nameservers = [ "1.1.1.3" "1.0.0.3" ];
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";         # disable root login
      PasswordAuthentication = false; # disable password login
    };
    openFirewall = true;
  };
  programs.ssh.extraConfig = ''
  Host github.com
  	IdentityFile ~/.ssh/jimmys-github
  '';

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
        neovim
        ansible
        blueman
        bluez
        gcc
        clang
        gdb
        glib
        eza
        zoxide
        p7zip
        unzip
        zip
        ffmpeg
        xdg-utils
        killall
        socat
        sops
        wget
        curl
        git
        sysstat
        lm_sensors  
        scrot
        neofetch
        xfce.thunar  
        nnn 
        fzf
        update-systemd-resolved
    ];
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.power-profiles-daemon = {
    enable = true;
  };
  security.polkit.enable = true;
  security.sudo = {
    enable = true;
    extraRules = [{
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = [ "NOPASSWD" ];
        }
      ];
      groups = [ "wheel" ];
    }];
  };

  services = {
    dbus.packages = [ pkgs.gcr ];

    geoclue2.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  };
  
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aurelius = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Marcus Aurelius";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
