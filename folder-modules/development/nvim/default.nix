{ config, lib, inputs, pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
    };
  };
  home = {
    packages = with pkgs; [
      #-- LSP --#
      nodePackages_latest.bash-language-server
      nixd
      lua-language-server
      pyright
      clang-tools
      #-- tree-sitter --#
      tree-sitter
      #-- format --#
      stylua
      black
      nixpkgs-fmt
      beautysh
      #-- Debug --#
      lldb
    ];
  };

  home.file.".config/nvim/init.lua".source = ./init.lua;
  home.file.".config/nvim/lua".source = ./lua;
  home.file.".config/nvim/after".source = ./after;
}
