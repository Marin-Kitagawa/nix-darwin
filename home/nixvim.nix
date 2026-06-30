{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # -- General Neovim Options --
    opts = {
      relativenumber = true;
      number = true;
      spell = false;
      signcolumn = "auto";
      wrap = false;
      termguicolors = true;
      scrolloff = 8;

      shell = "${pkgs.powershell}/bin/pwsh";
      shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;";
      shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode";
      shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode";
      shellquote = "";
      shellxquote = "";
    };

    # -- Clipboard --
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    # -- Keymaps --
    keymaps = [
      # Buffer Navigation
      {
        mode = "n";
        key = "L";
        action = "<cmd>bnext<cr>";
        options.desc = "Next buffer";
      }
      {
        mode = "n";
        key = "H";
        action = "<cmd>bprev<cr>";
        options.desc = "Previous buffer";
      }
      {
        mode = "n";
        key = "<Leader>b";
        action = "";
        options.desc = "Buffers";
      }
      {
        mode = "n";
        key = "<Leader>bD";
        action = "<cmd>bd<cr>";
        options.desc = "Close buffer";
      }

      # Yazi
      {
        mode = ["n" "v"];
        key = "<leader>-";
        action = "<cmd>Yazi<cr>";
        options.desc = "Open yazi at current file";
      }
      {
        mode = "n";
        key = "<leader>cw";
        action = "<cmd>Yazi cwd<cr>";
        options.desc = "Open yazi in working directory";
      }
      {
        mode = "n";
        key = "<c-up>";
        action = "<cmd>Yazi toggle<cr>";
        options.desc = "Resume last yazi session";
      }

      # Diagnostics
      {
        mode = "n";
        key = "gl";
        action = "<cmd>lua vim.diagnostic.open_float()<cr>";
        options.desc = "Hover diagnostics";
      }

      # Blink Chartoggle (Moved from plugin opts to here!)
      {
        mode = ["n" "v"];
        key = "<C-;>";
        action.__raw = "function() require('blink.chartoggle').toggle_char_eol(';') end";
        options.desc = "Toggle ; at eol";
      }
      {
        mode = ["n" "v"];
        key = ",";
        action.__raw = "function() require('blink.chartoggle').toggle_char_eol(',') end";
        options.desc = "Toggle , at eol";
      }
    ];

    # -- Plugins Configuration --
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          ensure_installed = ["lua" "vim" "nix" "markdown" "markdown_inline" "python" "go" "rust"];
          highlight.enable = true;
        };
      };

      lsp = {
        enable = true;
        servers = {
          lua_ls = {
            enable = true;
            settings.Lua.format.enable = false;
          };
          pyright.enable = true;
          gopls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
          formatters_by_ft = {
            lua = ["stylua"];
            go = ["goimports" "gofmt"];
            rust = ["rustfmt"];
            python = ["isort" "black"];
            "*" = ["codespell"];
            "_" = ["trim_whitespace"];
          };
        };
      };

      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            preset = "default";
            # NOTE: Custom keymaps like <C-;> must be global keymaps (see above),
            # NOT defined here in the completion menu settings.
          };
          cmdline = {
            enabled = true;
            sources = ["cmdline" "path"];
          };
          sources.default = ["lsp" "path" "snippets" "buffer"];
        };
      };

      web-devicons.enable = true;

      noice = {
        enable = true;
        settings = {
          notify.enabled = false;
          lsp.progress.enabled = true;
          presets = {
            bottom_search = false;
            command_palette = false;
            long_message_to_split = false;
            inc_rename = false;
            lsp_doc_border = false;
          };
        };
      };

      snacks = {
        enable = true;
        settings = {
          bigfile.enabled = true;
          dashboard = {
            enabled = true;
            preset.header = ''
              `7MMM.     ,MMF'      `7MM                                                    .g8"""bgd
                MMMb    dPMM          MM                                                  .dP'     `M
                M YM   ,M MM  ,p6"bo  MM  ,MP'.gP"Ya `7MMpMMMb.  `7MMpMMMb.   ,6"Yb.      dM'       ` `7Mb,od8 ,6"Yb.  ,p6"bo   .gP"Ya
                M  Mb  M' MM 6M'  OO  MM ;Y  ,M'   Yb  MM    MM    MM    MM  8)   MM      MM            MM' "'8)   MM 6M'  OO  ,M'   Yb
                M  YM.P'  MM 8M       MM;Mm  8M""""""  MM    MM    MM    MM   ,pm9MM      MM.    `7MMF' MM     ,pm9MM 8M       8M""""""
                M  `YM'   MM YM.    , MM `Mb.YM.    ,  MM    MM    MM    MM  8M   MM      `Mb.     MM   MM    8M   MM YM.    , YM.    ,
              .JML. `'  .JMML.YMbmd'.JMML. YA.`Mbmmd'.JMML  JMML..JMML  JMML.`Moo9^Yo.      `"bmmmdPY .JMML.  `Moo9^Yo.YMbmd'   `Mbmmd'
            '';
          };
          explorer.enabled = true;
          indent.enabled = true;
          input.enabled = true;
          notifier = {
            enabled = true;
            timeout = 3000;
          };
          picker.enabled = true;
          quickfile.enabled = true;
          scope.enabled = true;
          scroll.enabled = true;
          statuscolumn.enabled = true;
          words.enabled = true;
        };
      };

      yazi = {
        enable = true;
        settings = {
          open_multiple_tabs = true;
          open_for_directories = true;
          floating_window_scaling_factor = 0.95;
          integrations = {
            grep_in_directory = "snacks.picker";
            grep_in_selected_files = "snacks.picker";
          };
        };
      };

      gitsigns.enable = true;
      lazygit.enable = true;
      copilot-vim.enable = true;
      cheatsheet.enable = true;
      markdown-preview.enable = true;
      wakatime.enable = true;
      mini.enable = true;
      none-ls.enable = true;
      nvim-autopairs.enable = true;
    };

    # -- Extra Plugins --
    extraPlugins = with pkgs.vimPlugins; [
      (pkgs.vimUtils.buildVimPlugin {
        name = "astrotheme";
        src = pkgs.fetchFromGitHub {
          owner = "AstroNvim";
          repo = "astrotheme";
          rev = "4163138098bb0c933919bf1a799ab50c9b94f865";
          hash = "sha256-/Yymc+NlXXnsGXwsbtBD1By35NVPhVCAeAFagxeh33w=";
        };
      })
      markview-nvim
      quicker-nvim
      heirline-nvim
    ];

    # -- Extra Config Lua --
    extraConfigLua = ''
      -- AstroTheme Setup
      require("astrotheme").setup({
        palette = "astrodark",
        style = {
          transparent = false,
          inactive = true,
          float = true,
          neotree = true,
          border = true,
          title_invert = true,
          italic_comments = true,
        },
        palettes = {
          global = {
            my_grey = "#ebebeb",
            my_color = "#ffffff"
          },
          astrodark = {
            ui = {
              red = "#800010",
              accent = "#CC83E3"
            },
            syntax = {
              cyan = "#800010",
              comments = "#CC83E3"
            },
            my_color = "#000000"
          },
        },
        highlights = {
          global = {
            modify_hl_groups = function(hl, c)
              hl.PluginColor4 = {fg = c.my_grey, bg = c.none }
            end,
            ["@String"] = {fg = "#ff00ff", bg = "NONE"},
          },
          astrodark = {
            modify_hl_groups = function(hl, c)
              hl.Comment.fg = c.my_color
              hl.Comment.italic = true
            end,
            ["@String"] = {fg = "#ff00ff", bg = "NONE"},
          },
        },
      })

      -- ACTIVATE THEME AFTER SETUP (Wrapped in pcall for safety)
      if not pcall(vim.cmd, "colorscheme astrodark") then
        vim.notify("Error loading astrodark theme", vim.log.levels.ERROR)
      end

      -- Polish.lua logic
      vim.filetype.add {
        extension = { foo = "fooscript" },
        filename = { ["Foofile"] = "fooscript" },
        pattern = { ["~/%.config/foo/.*"] = "fooscript" },
      }

      -- Quicker Setup
      require("quicker").setup({
        keys = {
            { ">", "<cmd>lua require('quicker').expand()<CR>", desc = "Expand quickfix content" },
        },
        borders = {
            vert = "┃",
            strong_header = "━",
        }
      })
    '';

    # -- Extra Packages --
    extraPackages = with pkgs; [
      lua-language-server
      gopls
      pyright
      rust-analyzer
      stylua
      gotools
      black
      isort
      codespell
      ripgrep
      fd
      lazygit
    ];
  };
}
