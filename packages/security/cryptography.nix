{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    age
    gnupg
    pinentry_mac # macOS pinentry (upstream used pinentry-qt, which is Linux-only)
  ];
}
