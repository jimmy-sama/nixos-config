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
      plugins = [
	pkgs.vimPlugins.packer-nvim
      ];
    };
  };
  home.file = {
  ".config/nvim/init.lua".source = ./init.lua;
  ".config/nvim/lua".source = ./lua;
  ".config/nvim/after".source = ./after;
  };
}
