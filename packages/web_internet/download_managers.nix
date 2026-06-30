{pkgs, ...}: {
  # kget (KDE) and uget/uget-integrator are Linux-only; download managers omitted on darwin.
  environment.systemPackages = with pkgs; [
  ];
}
