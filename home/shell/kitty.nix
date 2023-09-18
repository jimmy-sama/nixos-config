{ pkgs, config, lib, ...}:
{
  programs.kitty = { 
    enable = true;
    font = { 
      name = "JetbrainsMono Nerd Font";
      size = 10;
    };
   
      settings = {
 
        shell = "zsh";
        confirm_os_window_close = "0";
        selection_foreground = "#2e3440";
        selection_background = "#d8dee9";
        url_color = "#0087BD";
        background_opacity = "1.0";
        cursor = "#abb2bf";
        window_padding_width = "0";
        enable_audio_bell = "no";
    };
  };
} 
