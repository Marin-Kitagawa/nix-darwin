{
  programs.zsh.shellAliases = {
    hw = "hwinfo --short";
    jctl = "journalctl -p 3 -xb";
    microcode = "grep . /sys/devices/system/cpu/vulnerabilities/*";
    probe = "sudo -E hw-probe -all -upload";
  };
}
