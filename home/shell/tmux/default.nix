{
  programs.tmux = {
    enable = true;
    configFile.source = ./.tmux.conf;
  };
}
