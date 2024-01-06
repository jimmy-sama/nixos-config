{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-history-substring-search"; }
      ];
    };
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake .#rtx-2070";
      ls = "ls -AFlh --color=always";
    };
    sessionVariables = rec {
      ENV_VAULT = "$HOME/.env_vault";
      PATH = "$PATH:/usr/local/go/bin";
    };
    initExtra = ''
      function env_vault.load(){
      echo "Loading env vault..."
      source =(ansible-vault view $ENV_VAULT)
      }

      function env_vault.edit(){
        ansible-vault edit $ENV_VAULT
      }

      cd () {
        if [ -n "$1" ]; then
            builtin cd "$@" && ls
        else
            builtin cd ~ && ls
        fi
      }
    '';
  };
}
