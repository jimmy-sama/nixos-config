{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    ripgrep
    yq-go    # https://github.com/mikefarah/yq
    htop
    killall
    lolcat
    xclip

    # misc
    libnotify
    wineWowPackages.wayland
    xdg-utils
    graphviz
    
    # testing
    discord
    vmware-horizon-client
    openvpn

    # productivity
    obsidian

    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn

    # db related
    dbeaver
    mycli
    pgcli
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
    };

    btop.enable = true;  # replacement of htop/nmon
    eza.enable = true;   # A modern replacement for ‘ls’
    jq.enable = true;    # A lightweight and flexible command-line JSON processor
    ssh.enable = true;
    aria2.enable = true;

    skim = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'exa --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };
  };

  services = {
    syncthing.enable = true;

    # auto mount usb drives
    udiskie.enable = true;
  };
}
