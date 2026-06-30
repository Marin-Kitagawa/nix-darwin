{
  programs.zsh.shellAliases = {
    fix-gpg-check = "gpg2 --keyserver-options auto-key-retrieve --verify";
    gpg-check = "gpg2 --keyserver-options auto-key-retrieve --verify";
    gpg-retrieve = "gpg2 --keyserver-options auto-key-retrieve --receive-keys";
  };
}
