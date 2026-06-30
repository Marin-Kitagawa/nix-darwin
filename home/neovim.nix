{
  config,
  pkgs,
  ...
}: let
  sources = import ./nix/sources.nix;
in {
  xdg.configFile = {
    nvim = {
      # Guard against nvim not being on PATH during activation (it lives in the
      # system profile, which may not be on PATH yet on the first switch).
      onChange = "command -v nvim >/dev/null && nvim --headless -c 'if exists(\":LuaCacheClear\") | :LuaCacheClear' +quitall || true";
      source = sources.AstroNvim;
    };
  };
}
