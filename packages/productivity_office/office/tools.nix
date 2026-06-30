{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libqalculate # provides the `qalc` CLI; qalculate-qt GUI is Linux-only
  ];
}
