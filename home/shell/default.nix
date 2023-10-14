{config, ...}: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./kitty.nix
    ./starship.nix
    ./tmux
    ./zsh
  ];

  # add environment variables
  home.sessionVariables = {
    # set default applications
    BROWSER = "firefox";
    TERMINAL = "kitty";
    SHELL = "zsh";
  };
}
