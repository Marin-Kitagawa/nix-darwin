{...}: {
  # WezTerm itself is installed via a Homebrew cask (see darwin.nix) — the
  # nix-built .app does not launch reliably on macOS (it's a symlink into the
  # Nix store and unsigned). We only manage its config here; the cask app reads
  # ~/.config/wezterm/wezterm.lua.
  xdg.configFile."wezterm/wezterm.lua".source = ./wezterm.lua;
}
