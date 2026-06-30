{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    chezmoi
    tldr
    # Dropped (Linux-only): appimage-run, pavucontrol, sherlock, steam-run, tlp, wl-clipboard
  ];
}
