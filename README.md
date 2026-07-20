# nix-darwin config

Declarative macOS system configuration using
[nix-darwin](https://github.com/nix-darwin/nix-darwin) +
[home-manager](https://github.com/nix-community/home-manager), targeting an
Apple Silicon Mac (`aarch64-darwin`).

This is a macOS port of my NixOS configs —
[nixos-config](https://github.com/Marin-Kitagawa/nixos-config) and
[nixos-home-manager-config](https://github.com/Marin-Kitagawa/nixos-home-manager-config) —
keeping the portable parts and dropping anything Linux-specific.

## Layout

- `flake.nix` — inputs (nixpkgs unstable, nix-darwin, home-manager) and the `a`
  darwin configuration.
- `darwin.nix` — system config: Nix settings, fonts, automatic GC, declarative
  Homebrew (casks), and imports the package tree.
- `packages/` — system packages grouped by category (`development`, `files`,
  `security`, `system`, `media`, `productivity_office`, `web_internet`).
  Mirrors the structure of the NixOS repo.
- `home/` — home-manager modules: `git`, `zsh` (+ `zsh/aliases/`), `neovim`
  (AstroNvim via niv), `wezterm`, `vscode`, `direnv`, `zoxide`. Disabled modules
  (`atuin`, `kitty`, `ghostty`, `nixvim`, `zen-browser`) are kept as commented
  imports.

## Usage

Rebuild after editing the config:

```sh
sudo darwin-rebuild switch --flake ~/.config/nix-darwin#a
```

(The flake attribute `a` matches the host name. Under `sudo`, use the absolute
path `/Users/<you>/.config/nix-darwin` since `~` resolves to `/var/root`.)

### Helper script: `nixd`

Instead of the long commands above, use the bundled [`bin/nixd`](bin/nixd)
wrapper — `nixd switch`, `nixd upgrade`, `nixd gc`, `nixd rollback`, etc. It
targets this flake automatically. See **[docs/nixd.md](docs/nixd.md)** for the
full reference, workflows, and an old-vs-new command comparison.

```sh
nixd switch      # sudo darwin-rebuild switch --flake ~/.config/nix-darwin#a
nixd upgrade     # update flake.lock, then switch
nixd gc          # collect garbage (generations older than 30 days)
nixd help        # list all commands
```

## Bootstrap (fresh machine)

1. Install Nix with the official multi-user installer and enable flakes
   (`experimental-features = nix-command flakes`).
2. Install [Homebrew](https://brew.sh) (required for the GUI casks).
3. Clone this repo to `~/.config/nix-darwin`.
4. First switch:

   ```sh
   nix run github:nix-darwin/nix-darwin#darwin-rebuild -- \
     switch --flake ~/.config/nix-darwin#a
   ```

## Differences from the NixOS configs

- **`BlackNix` (security / pentest tooling) is intentionally excluded.**
- Linux-only modules are dropped: kernel, nvidia, KDE/Plasma, flatpak, firewall,
  bluetooth, GTK/KDE themes, mesa/vulkan, `solaar`, `tlp`, etc.
- GUI apps that are Linux-only in nixpkgs are installed as **Homebrew casks**
  instead: `brave-browser`, `vlc`, `qbittorrent`, `obsidian`, `onlyoffice`,
  `dbeaver-community`.
- Adaptations: `pinentry-qt` → `pinentry_mac`, `wl-copy` → `pbcopy`,
  `nixos-rebuild` → `darwin-rebuild`, git credential helper `libsecret` →
  `osxkeychain`, and the Nix daemon SSL bundle pinned to `/etc/ssl/cert.pem`.

## Git identity

The global identity is set in `home/git.nix`. Repositories under `~/Work` use a
separate identity via an `includeIf "gitdir:~/Work/"` pointing at
`~/.gitconfig-work` (a plain file kept outside this repo, so work credentials are
never committed here).
