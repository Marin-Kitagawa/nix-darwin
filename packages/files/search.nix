{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fd
    fzf
    ripgrep
    ripgrep-all
    # Dropped (Linux/GTK-only): fsearch
  ];
}
