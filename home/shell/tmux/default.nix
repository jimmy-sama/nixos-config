{
  programs.tmux = {
    enable = true;
  };
  home.file = {
    ".tmux.conf".source = ./.tmux.conf;
    ".tmux".source = ./.tmux;
  };
}
