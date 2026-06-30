{pkgs, ...}: {
  # onlyoffice is installed via a Homebrew cask on darwin (see darwin.nix).
  environment.systemPackages = with pkgs; [
  ];
}
