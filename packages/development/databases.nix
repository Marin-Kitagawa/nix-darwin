{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    sqlite
    # dbeaver-bin is Linux-only; DBeaver is installed via a Homebrew cask on darwin.
  ];
}
