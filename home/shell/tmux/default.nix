{
  programs.tmux = {
    enable = true;
    plugins = [
            catppuccin
            sensible
        ];
    tmuxConfig = ''
        set -s default-terminal 'tmux-256color'

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

        unbind C-b
        set-option -g prefix C-a
        bind-key C-a send-prefix

        is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
        bind-key -n C-h  if-shell  "$is_vim"  "send-keys C-h"  "select-pane -L"
        bind-key -n C-j   if-shell  "$is_vim"  "send-keys C-j"   "select-pane -D"
        bind-key -n C-k  if-shell  "$is_vim"  "send-keys C-k"  "select-pane -U"
        bind-key -n C-l   if-shell  "$is_vim"  "send-keys C-l"   "select-pane -R"
        bind-key -n C-\   if-shell  "$is_vim"  "send-keys C-\\"  "select-pane -l"

        set -g base-index 1
        setw -g mouse on
        '';
  };
#  home.file = {
#    ".tmux.conf".source = ./.tmux.conf;
#    ".tmux".source = ./.tmux;
#  };
}
