{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./browsers/firefox.nix
    ./browsers.nix
    ./common.nix
    ./git.nix
    ./media.nix
    ./xdg.nix
  ];
}
