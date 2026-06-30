{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    unzip
    # Dropped (Linux/Qt-only): peazip
  ];
}
