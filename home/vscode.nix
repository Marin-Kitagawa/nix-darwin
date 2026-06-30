{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = true;
    profiles = {
      default = {
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = true;
        extensions = (
          with pkgs.vscode-extensions;
            [
              aaron-bond.better-comments
              apollographql.vscode-apollo
              asciidoctor.asciidoctor-vscode
              batisteo.vscode-django
              bbenoist.nix
              bierner.markdown-checkbox
              christian-kohler.npm-intellisense
              davidanson.vscode-markdownlint
              dbaeumer.vscode-eslint
              donjayamanne.githistory
              dotjoshjohnson.xml
              esbenp.prettier-vscode
              formulahendry.auto-close-tag
              formulahendry.auto-rename-tag
              foxundermoon.shell-format
              golang.go
              graphql.vscode-graphql
              graphql.vscode-graphql-syntax
              james-yu.latex-workshop
              mechatroner.rainbow-csv
              mhutchie.git-graph
              mikestead.dotenv
              mongodb.mongodb-vscode
              ms-azuretools.vscode-docker
              ms-python.debugpy
              ms-python.python
              ms-python.vscode-pylance
              ms-toolsai.jupyter
              ms-toolsai.jupyter-keymap
              ms-toolsai.jupyter-renderers
              ms-toolsai.vscode-jupyter-cell-tags
              ms-toolsai.vscode-jupyter-slideshow
              ms-vscode-remote.remote-containers
              myriad-dreamin.tinymist
              oderwat.indent-rainbow
              pkief.material-icon-theme
              pkief.material-product-icons
              quicktype.quicktype
              redhat.vscode-yaml
              ritwickdey.liveserver
              rust-lang.rust-analyzer
              samuelcolvin.jinjahtml
              shd101wyy.markdown-preview-enhanced
              svelte.svelte-vscode
              tamasfe.even-better-toml
              unifiedjs.vscode-mdx
              usernamehw.errorlens
              vadimcn.vscode-lldb
              visualstudioexptteam.vscodeintellicode
              visualstudioexptteam.intellicode-api-usage-examples
              vscodevim.vim
              wakatime.vscode-wakatime
              yzhang.markdown-all-in-one
              zhuangtongfa.material-theme
              zxh404.vscode-proto3
            ]
            ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
              {
                name = "vscode-thunder-client";
                publisher = "rangav";
                version = "2.32.10";
                sha256 = "cf3af3b71c3a97bd602cbd38eae567186b8dd96364ad19c0f9f79f53e5ee7118";
              }
              {
                name = "sqltools";
                publisher = "mtxr";
                version = "0.28.3";
                sha256 = "6d3ac70218fcbb0cd12089b388ab0e8b365ff3e937b7e56b90e799ac5c7b487f";
              }
              {
                name = "sqltools-driver-pg";
                publisher = "mtxr";
                version = "0.5.4";
                sha256 = "5e73d33053603064f6b497bc5a59a1301dc396ebcc671f447b6c3bc4c0b32d83";
              }
              {
                name = "sqltools-driver-sqlite";
                publisher = "mtxr";
                version = "0.5.1";
                sha256 = "c0581beb00d280f6cfb4454a6c771479446a6d502a0ec10484551c06142d985f";
              }
              {
                name = "vscode-data-preview";
                publisher = "randomfractalsinc";
                version = "2.3.0";
                sha256 = "sha256-hKnAKdt0splUFyN8n9IdTD8NKjahIMMrLkkwg55zWv0=";
              }
              {
                name = "es7-react-js-snippets";
                publisher = "dsznajder";
                version = "4.4.3";
                sha256 = "sha256-QF950JhvVIathAygva3wwUOzBLjBm7HE3Sgcp7f20Pc=";
              }
              {
                name = "vscode-typescript-next";
                publisher = "ms-vscode";
                version = "5.7.20240904";
                sha256 = "aec57c622887ca5d5e229833a3b69798180e24c6d844f3cca6a0f50cb6c9a880";
              }
              {
                name = "vscode-json-validate";
                publisher = "rioj7";
                version = "1.5.0";
                sha256 = "1478d7bfc68937d91928505e538c4ce2f0db8e3578d8a4db693964de1e37cfd2";
              }
              {
                name = "vsc-python-indent";
                publisher = "kevinrose";
                version = "1.18.0";
                sha256 = "86238c707896f0a1666aeed66258b4a45b3304191be87a6166ccfe413e6f1efd";
              }
              {
                name = "svelte-bundle";
                publisher = "1yib";
                version = "1.0.0";
                sha256 = "9a00c235a15d5818218b6f20dda5beea291396c219dcfefc73d1a399ee8607cf";
              }
            ]
        );
        userSettings = {
          "files.autoSave" = "afterDelay";

          # Network
          "http.proxySupport" = "off";
          "http.proxyStrictSSL" = false;

          # Styling
          "workbench.colorTheme" = "One Dark Pro Flat";
          "workbench.iconTheme" = "material-icon-theme";
          "editor.fontFamily" = "'FiraCode Nerd Font'";
          "editor.fontLigatures" = true;

          # Other
          "telemetry.telemetryLevel" = "off";
          "update.showReleaseNotes" = false;

          # Whitespace
          "files.trimTrailingWhitespace" = true;
          "files.trimFinalNewlines" = true;
          "files.insertFinalNewline" = true;
          "diffEditor.ignoreTrimWhitespace" = false;

          # Git
          "git.enableCommitSigning" = true;
          "git-graph.repository.sign.commits" = true;
          "git-graph.repository.sign.tags" = true;
          "git-graph.repository.commits.showSignatureStatus" = true;

          # Window
          "window.customTitleBarVisibility" = "windowed";
          "window.dialogStyle" = "custom";
          "window.menuBarVisibility" = "hidden";
          "window.titleBarStyle" = "custom";

          # Extension configuration
          "sqltools.useNodeRuntime" = true;

          # Language settings
          "[javascript]" = {
            "editor.defaultFormatter" = "vscode.typescript-language-features";
          };
          "javascript.updateImportsOnFileMove.enabled" = "always";

          "[typescriptreact]" = {
            "editor.defaultFormatter" = "vscode.typescript-language-features";
          };

          "docwriter.hotkey.windows" = "Alt + .";
          "workbench.colorCustomizations" = {};
          "[python]" = {
            "diffEditor.ignoreTrimWhitespace" = true;
          };
          "vim.handleKeys" = {
            "<C-p>" = false;
            "<C-w>" = false;
          };
          "[json]" = {
            "editor.defaultFormatter" = "vscode.json-language-features";
          };
          "diffEditor.maxComputationTime" = 0;
          "files.associations" = {
            "*.jinja" = "jinja-html";
          };
          "asciidoc.preview.fontFamily" = "Work Sans";
          "asciidoc.preview.style" = "/home/irelia/Documents/Obsidian/CSS/asciidoc-vscode.css";
        };
      };
    };
  };
}
