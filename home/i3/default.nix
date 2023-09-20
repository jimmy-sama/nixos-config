{ pkgs, ...}: {
  # i3 window manager's config, based on https://github.com/endeavouros-team/endeavouros-i3wm-setup

  imports = [
    ./x11-apps.nix
  ];

  home.file = {
    ".config/i3/wallpaper.png".source = ../../wallpaper.png;
    ".config/i3/config".source = ./config;
    ".config/i3/i3status.conf".source = ./i3status.conf;
    ".config/i3/keybindings".source = ./keybindings;
    ".config/i3/scripts" = {
      source = ./scripts;
      # copy the scripts directory recursively
      recursive = true;
      executable = true; # make all scripts executable
    };
  };

  # allow fontconfig to discover fonts and configurations installed through home.packages
  fonts.fontconfig.enable = true;

  systemd.user.sessionVariables = {
    "LIBVA_DRIVER_NAME" = "nvidia";
    "GBM_BACKEND" = "nvidia-drm";
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
  };

}
