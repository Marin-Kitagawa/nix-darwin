{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    age
    gnupg
    # pinentry removed per request (gnupg has no pinentry on this Mac now; add
    # pinentry_mac back if GPG passphrase prompts are needed).
  ];
}
