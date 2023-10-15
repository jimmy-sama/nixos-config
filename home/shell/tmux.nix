{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
            sensible
            {
                plugin = catppuccin; 
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
                '';
            }
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
