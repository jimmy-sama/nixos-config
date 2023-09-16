{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    xsel # for clipboard support in x11, required by tmux's clipboard support
  ];
}
