{pkgs, ...}: {
  # brave is Linux-only in nixpkgs and is installed via a Homebrew cask (see darwin.nix).
  # zen-browser was a Linux Firefox fork; omitted on darwin.
  environment.systemPackages = with pkgs; [
  ];
}
