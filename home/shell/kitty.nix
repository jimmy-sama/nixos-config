{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      window.opacity = 0.95;
      window.dynamic_padding = true;
      window.padding = {
        x = 5;
        y = 5;
      };
      font = "JetBrainsMono Nerd Font";
    };
  };
}
