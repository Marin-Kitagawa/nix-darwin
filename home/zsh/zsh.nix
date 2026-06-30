{config, ...}: let
  sources = import ../nix/sources.nix;
in {
  imports = [
    ./aliases/aliases.nix
  ];
  programs.zsh = {
    enable = true;
    autocd = true;
    antidote = {
      enable = true;
      plugins = [
        "Marin-Kitagawa/enhancd"
        "robertzk/send.zsh"
        "urbainvaes/fzf-marks"
        "Tarrasch/zsh-functional"
        "zdharma-continuum/history-search-multi-word"
        "z-shell/F-Sy-H"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-syntax-highlighting"
        "chisui/zsh-nix-shell"
        "wfxr/forgit"
        #          "jirutka/zsh-shift-select"
      ];
      useFriendlyNames = true;
    };

    # Enable Completion
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = false; # Using F-Sy-H via antidote instead
    };

    # History settings
    history = {
      size = 50000;
      save = 50000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      share = true;
      ignoreSpace = true;
    };

    plugins = [
      #      {
      #        name = "enhancd";
      #        file = "enhancd.plugin.zsh";
      #        src = pkgs.fetchFromGitHub {
      #          owner = "Marin-Kitagawa";
      #          repo = "enhancd";
      #          rev = "657525aed3dcaf78d663f781316d7b222bd053e9";
      #          sha256 = "i2/H59I59eE1v2KoNJGt9aQUuM1YKU+XPU/QMtRNRCI=";
      #        };
      #      }
      {
        name = "calc.plugin.zsh";
        file = "calc.plugin.zsh";
        src = sources.zshCalcPlugin.outPath;
      }
      #      {
      #        name = "send.plugin.zsh";
      #        file = "send.plugin.zsh";
      #        src = pkgs.fetchFromGitHub {
      #          owner = "robertzk";
      #          repo = "send.zsh";
      #          rev = "d1291eb8900c2f9ebbc2b977b1ba67e2681c1b28";
      #          sha256 = "ss4526z8G5WgeoC6s8+1K7MYWs5BsXxd8+I6wROwDAo=";
      #        };
      #      }
      #      {
      #        name = "fzf-marks.plugin.zsh";
      #        file = "fzf-marks.plugin.zsh";
      #        src = pkgs.fetchFromGitHub {
      #          owner = "urbainvaes";
      #          repo = "fzf-marks";
      #          rev = "08cc34a3668c0f7022d55e0e2d3270fa429b3390";
      #          sha256 = "qVOAoCtOpQeVo4W00NIOHadrnbwP/GCHVnVoH0kwEgM=";
      #        };
      #      }
      #      {
      #        name = "functional.plugin.zsh";
      #        file = "functional.plugin.zsh";
      #        src = pkgs.fetchFromGitHub {
      #          owner = "Tarrasch";
      #          repo = "zsh-functional";
      #          rev = "cb44a61cd38599f794a09f44c0a46cddbb725b2a";
      #          sha256 = "Vc/E/ERenr9BkhM/P28ZjTfAsg3ayJ7accVrNFR1jnc=";
      #        };
      #      }
      #      {
      #        name = "vi-mode";
      #        file = "zsh-vi-mode.plugin.zsh";
      #        src = pkgs.fetchFromGitHub {
      #          owner = "jeffreytse";
      #          repo = "zsh-vi-mode";
      #          rev = "287efa19ec492b2f24bb93d1f4eaac3049743a63";
      #          sha256 = "HMfC4s7KW4bO7H6RYzLnSARoFr1Ez89Z2VGONKMpGbw=";
      #        };
      #      }
      #      {
      #        name = "history-search-multi-word";
      #        file = "history-search-multi-word.plugin.zsh";
      #        src = pkgs.fetchFromGitHub {
      #          owner = "zdharma-continuum";
      #          repo = "history-search-multi-word";
      #          rev = "c4dcddc1cd17e7e0909471703f3526170db0f475";
      #          sha256 = "KgKm9qzFnwXDXwmTruPgC0tjmiTY5AiGdrWW4zDWUF4=";
      #        };
      #      }
      #      {
      #        name = "f-sy-h";
      #        file = "F-Sy-H.plugin.zsh";
      #        src = pkgs.fetchFromGitHub {
      #          owner = "z-shell";
      #          repo = "F-Sy-H";
      #          rev = "3dea11a9018061e6e3a77e529b79e5654679d3a0";
      #          sha256 = "AEeGEx2vyyHVS92Nla7XoqSx3rTpQHYwPMrK1jFH1Mg=";
      #        };
      #      }
      #      {
      #        name = "zsh-autosuggestions";
      #        file = "zsh-autosuggestions.plugin.zsh";
      #        src = pkgs.fetchFromGitHub {
      #          owner = "zsh-users";
      #          repo = "zsh-autosuggestions";
      #          rev = "c3d4e576c9c86eac62884bd47c01f6faed043fc5";
      #          sha256 = "B+Kz3B7d97CM/3ztpQyVkE6EfMipVF8Y4HJNfSRXHtU=";
      #        };
      #      }
      #      {
      #        name = "zsh-syntax-highlighting";
      #        file = "zsh-syntax-highlighting.plugin.zsh";
      #        src = pkgs.fetchFromGitHub {
      #          owner = "zsh-users";
      #          repo = "zsh-syntax-highlighting";
      #          rev = "e0165eaa730dd0fa321a6a6de74f092fe87630b0";
      #          sha256 = "4rW2N+ankAH4sA6Sa5mr9IKsdAg7WTgrmyqJ2V1vygQ=";
      #        };
      #      }
      {
        name = "zsh-shift-select";
        file = "zsh-shift-select.plugin.zsh";
        src = sources.zshShiftSelect.outPath;
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "cp"
        "wd"
        "git"
        "ruby"
        "emoji"
        "emotty"
        "extract"
        "python"
        "copyfile"
        "dircycle"
        "encode64"
        "jsontools"
        "git-extras"
      ];
      theme = "random";
    };
    siteFunctions = {
      mcd = ''
        mkdir -p "$1" && cd "$1"
      '';
      back = ''
        for i in `seq 1 $1`
        do
          \cd ..
        done
      '';
      getHash = ''
        shasum -a 256 "$1" | cut -d " " -f 1 | pbcopy
      '';
      radc = ''
        for i in $(docker ps -q); do
          docker rm $i --force
        done
      '';
      radi = ''
        for i in $(docker images -q); do
          docker rmi $i --force
        done
      '';
    };
    initContent = ''
      clear
    '';
  };
}
