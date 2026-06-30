{ pkgs, username, ... }:
{
  imports = [
    ./packages/packages.nix
  ];

  # The macOS account that owns the primary GUI session (required by recent nix-darwin).
  system.primaryUser = username;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  # Replicated from the upstream configuration.nix nixpkgs config.
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # macOS ships a valid CA bundle here; pin it so the daemon doesn't fall back to
  # the broken /etc/ssl/certs/ca-certificates.crt symlink (crashes Nix 2.34.x).
  nix.settings.ssl-cert-file = "/etc/ssl/cert.pem";

  # Automatic GC (upstream used nix.gc.automatic + dates="daily"; darwin uses an
  # interval calendar spec instead of dates).
  nix.gc = {
    automatic = true;
    interval = {
      Hour = 3;
      Minute = 15;
    };
    options = "--delete-older-than 30d";
  };

  # Fonts (from upstream fonts.nix): FiraCode Nerd Font is used by every terminal
  # and editor config. (Work Sans was KDE/plasma-only, omitted.)
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  programs.zsh.enable = true;

  # Declarative Homebrew. GUI apps that are Linux-only in nixpkgs are installed as
  # casks here instead of via environment.systemPackages.
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "none";
    };
    taps = [ ];
    brews = [ ];
    casks = [
      "brave-browser"
      "vlc"
      "qbittorrent"
      "obsidian"
      "onlyoffice"
      "dbeaver-community"
    ];
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
}
