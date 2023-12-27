{pkgs, ...}:

{

  # i3 related options
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
        defaultSession = "none+i3";
        lightdm.enable = false;
        gdm.enable = true;
        setupCommands = ''
        ${pkgs.xorg.xrandr}/bin/xrandr --output DP-0 -s 2560x1440 -r 144
        '';
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        eww
        picom
        glava
        rofi          # application launcher, the same as dmenu
        dunst         # notification daemon
        i3lock        # default i3 screen locker
        i3blocks      # status bar 
        i3lock-fancy
        pywal
        xautolock     # lock screen after some time
        i3status      # provide information to i3bar
        picom         # transparency and shadows
        feh           # set wallpaper
        acpi          # battery information
        arandr        # screen layout manager
        dex           # autostart applications
        xbindkeys     # bind keys to commands
        xorg.xbacklight  # control screen brightness
        xorg.xdpyinfo      # get screen information
        sysstat       # get system information
     ];
    };

    # Configure keymap in X11
    layout = "us";
    xkbVariant = "intl";
  };

  # thunar file manager(part of xfce) related options
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
}

