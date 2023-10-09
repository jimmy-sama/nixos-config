{ config, pkgs, ... }:

{
  imports = [
    ./i3
    ./programs
    ./rofi
    ./shell
    ./neovim
  ];
  home = {
    username = "aurelius";
    homeDirectory = "/home/aurelius";

    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;
}
