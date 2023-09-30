{ config, lib, inputs, pkgs, ... }:

{
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      withPython3 = true;
      withNodeJs = true;
      extraPackages = [
      ];
      #-- Plugins --#
      plugins = with pkgs.vimPlugins;[ ];
      #-- --#
    };
  };
  home = {
    packages = with pkgs; [
      #-- LSP --#
      nodePackages_latest.bash-language-server
      nixd
      lua-language-server
      pyright
      zk
      rust-analyzer
      clang-tools
      #-- tree-sitter --#
      tree-sitter
      #-- format --#
      stylua
      black
      nixpkgs-fmt
      rustfmt
      beautysh
      nodePackages.prettier
      #-- Debug --#
      lldb
    ];
  };

  home.file.".config/nvim/init.lua".source = ./init.lua;
  home.file.".config/nvim/lua".source = ./lua;
}
