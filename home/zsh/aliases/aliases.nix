{
  imports = [
    ./cli.nix
    ./docker.nix
    ./eza.nix
    ./git.nix
    ./gpg.nix
    # ./hardware.nix    # Linux-only (hwinfo, journalctl, CPU vuln sysfs)
    # ./keyboard.nix    # Linux-only (localectl / X11 keymaps)
    ./misc.nix
    ./nix.nix
    ./security.nix
    ./system_maintenance.nix
    ./yt-dlp.nix
  ];
}
