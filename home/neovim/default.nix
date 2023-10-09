{ config, lib, inputs, pkgs, ... }:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      withPython3 = true;
      withNodeJs = true;
      withRuby = true;
    };
  };
  home.file.".config/nvim/init.lua".source = ./init.lua;
}
