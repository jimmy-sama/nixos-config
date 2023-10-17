{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "";
    };
  };
  #home.file.".zshrc".source = ./.zshrc;
}
