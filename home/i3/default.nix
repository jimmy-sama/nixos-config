{
  pkgs,
  config,
  ...
}: {
  home.file = {  
      ".config/i3/wallpaper.png".source = ../../wallpaper.png;
      ".config/i3/config".source = ./config;
      ".config/i3/i3blocks.conf".source = ./i3blocks.conf;
      ".config/i3/scripts" = {
          source = ./scripts;
          recursive = true;
          executable = true; 
      };
  };
}
