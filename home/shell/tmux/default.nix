{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins [
            catppuccin
            sensible
        ];
    baseIndex = 1;
    prefix = "C-a";
    terminal = "tmux-256color"
    extraConfig = ''
        set -g @catppuccin_window_right_separator "█ "
        set -g @catppuccin_window_number_position "right"
        set -g @catppuccin_window_middle_separator " | "
        set -g @catppuccin_window_default_fill "none"
        set -g @catppuccin_window_current_fill "all"
        set -g @catppuccin_status_modules_right "session host date_time"
        set -g @catppuccin_status_left_separator "█"
        set -g @catppuccin_status_right_separator "█"
        set -g @catppuccin_date_time_text "%m-%d %H:%M"
        set -g @catppuccin_flavour 'macchiato'

        setw -g mouse on
        '';
  };
#  home.file = {
#    ".tmux.conf".source = ./.tmux.conf;
#    ".tmux".source = ./.tmux;
#  };
}
