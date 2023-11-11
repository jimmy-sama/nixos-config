{ pkgs, ... }:
let
  homepage = "/home/aurelius/GitHub/SourceFile/homepage.html";
  #homepage = pkgs.fetchurl {
  #  url = "https://raw.githubusercontent.com/jimmy-sama/SourceFile/main/homepage.html";
  #  sha256 = "sha256-z8JJuh/sFXd7Dsog0205VEuV59euFqIj1sORFkyX/Lk=";
  #};
in
{
  home = {
    sessionVariables = {
      BROWSER = "firefox";
    };
  };
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisplayBookmarksToolbar = true;
        Preferences = {
          "browser.toolbars.bookmarks.visibility" = "never";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "media.ffmpeg.vaapi.enabled" = true;
        };
      };
    };
    profiles.default = {
      settings = {
        "browser.startup.homepage" = "file://${homepage}";
      };
    };
  };
}
