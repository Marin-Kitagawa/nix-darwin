{
  programs.zsh.shellAliases = {
    cls = "clear";
    md = "mkdir -p";
    pdw = "pwd";
    psa = "ps aux";
    psgrep = "ps aux | grep -v grep | grep -i -e VSZ -e";
    rmrf = "rm -rfv";
    sr = "sudo shutdown -r now";
    ssn = "sudo shutdown -h now";
    # Dropped (Linux/systemd-only): sysfailed, update-fc, update-grub
  };
}
