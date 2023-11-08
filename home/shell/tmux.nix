{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
            sensible
            catppuccin
        ];
    baseIndex = 1;
    prefix = "C-a";
    terminal = "tmux-256color";
    clock24 = false;
    extraConfig = ''
        setw -g mouse on
        '';
  };
}
