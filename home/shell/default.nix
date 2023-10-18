{config, ...}: let
in {
  imports = [
    ./kitty.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
  ];

  # add environment variables
  home.sessionVariables = {
    # set default applications
    BROWSER = "firefox";
    TERMINAL = "kitty";
    SHELL = "zsh";
  };
}
