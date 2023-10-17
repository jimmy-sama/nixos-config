{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
        enable = true;
        plugins = [ "git" "zsh-fzf-history-search" ];
        theme = "";
  };
  };
  home.file.".zshrc".source = ./.zshrc;
}
