{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "";
    };
    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true; # ignore commands starting with a space
      save = 20000;
      size = 20000;
      share = true;
    };
    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch --flake .#rtx-2070";
      ls = "ls -AFlh --color=always";
    };
  };
}
