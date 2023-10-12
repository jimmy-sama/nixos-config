{
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    userName = "jimmy-sama";
    userEmail = "lungmuss@proton.me";
  };
}
