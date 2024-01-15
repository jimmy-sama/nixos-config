{pkgs, ...}: {
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };

  home.packages = with pkgs;
    [
      #-- c/c++
      cmake
      cmake-language-server
      gnumake
      checkmake
      # c/c++ compiler, required by nvim-treesitter!
      gcc
      # c/c++ tools with clang-tools, the unwrapped version won't
      # add alias like `cc` and `c++`, so that it won't conflict with gcc
      llvmPackages.clang-unwrapped
      lldb

      #-- python
      nodePackages.pyright # python language server
      (python310.withPackages (
        ps:
          with ps; [
            ruff-lsp
            black # python formatter

            jupyter
            ipython
            pandas
            requests
            pyquery
            pyyaml

            ## emacs's lsp-bridge dependenciesge
            epc
            orjson
            sexpdata
            six
            setuptools
            paramiko
            rapidfuzz
          ]
      ))

      #-- nix
      nil
      rnix-lsp
      # nixd
      statix # Lints and suggestions for the nix programming language
      deadnix # Find and remove unused code in .nix source files
      alejandra # Nix Code Formatter

      #-- golang
      go
      gomodifytags
      iferr # generate error handling code for go
      impl # generate function implementation for go
      gotools # contains tools like: godoc, goimports, etc.
      gopls # go language server
      delve # go debugger

      #-- lua
      stylua
      lua-language-server

      #-- bash
      nodePackages.bash-language-server
      shellcheck
      shfmt

      #-- Others
      taplo # TOML language server / formatter / validator
      sqlfluff # SQL linter
      actionlint # GitHub Actions linter

      #-- Misc
      tree-sitter # common language parser/highlighter
      marksman # language server for markdown
      glow # markdown previewer
      fzf
      pandoc # document converter

      #-- Optional Requirements:
      gdu # disk usage analyzer, required by AstroNvim
      (ripgrep.override {withPCRE2 = true;}) # recursively searches directories for a regex pattern
    ]
    ++ (
      if pkgs.stdenv.isDarwin
      then []
      else [
        #-- verilog / systemverilog
        verible
        gdb
      ]
    );
}
