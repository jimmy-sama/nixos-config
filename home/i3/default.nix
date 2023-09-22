{
  pkgs,
  config,
  ...
}: {

  # wallpaper, binary file
  home.file.".config/i3/wallpaper.png".source = ../../wallpaper.png;
  home.file.".config/i3/config".source = ./config;
  home.file.".config/polybar/config.ini".source = ./polybar/config.ini;
  home.file.".config/i3/keybindings".source = ./keybindings;
  home.file.".config/i3/scripts" = {
    source = ./scripts;
    # copy the scripts directory recursively
    recursive = true;
    executable = true;  # make all scripts executable
  };
}
