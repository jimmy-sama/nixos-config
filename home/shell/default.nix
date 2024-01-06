{config, ...}: let
in {
  imports = [
    ./kitty.nix
    ./tmux.nix
    ./zsh.nix
  ];

  # add environment variables
  home.sessionVariables = {
    # set default applications
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
    SHELL = "zsh";
  };
}
