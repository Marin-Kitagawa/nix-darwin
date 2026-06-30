{
  programs.zsh.shellAliases = {
    bupskel = "cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)";
    nz = "nvim ~/.zshrc";
    rmgitcache = "rm -r ~/.cache/git";
    skel = "[ -d ~/.config ] || mkdir ~/.config && cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~";
    sz = "source ~/.zshrc";
  };
}
