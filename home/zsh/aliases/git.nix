{
  programs.zsh.shellAliases = {
    # --- Base ---
    g = "git";
    gconf = "git config --list";
    gs = "git status"; # Matches your original 'gs'

    # --- Add ---
    ga = "git add";
    gaa = "git add --all";
    gapa = "git add --patch";
    gau = "git add --update";

    # --- Commit ---
    gc = "git commit";
    gca = "git commit --amend --no-edit";
    gcae = "git commit --amend";
    gcam = "git commit -a -m";
    gcm = "git commit -m";

    # --- Branch ---
    gb = "git branch";
    gbD = "git branch -D";
    gba = "git branch -a";
    gcb = "git checkout -b";
    gco = "git checkout";
    gsw = "git switch";
    gswc = "git switch -c";

    # --- Push/Pull ---
    gf = "git fetch";
    gfa = "git fetch --all --prune";
    gp = "git push"; # Standard short alias
    gpf = "git push --force-with-lease";
    gpl = "git pull";
    gpsup = "git push --set-upstream origin $(git symbolic-ref --short HEAD)";

    # --- Diff ---
    gd = "git diff";
    gds = "git diff --staged";

    # --- Log ---
    gl = "git log --oneline --graph --decorate"; # Simple log
    glo = "git log --oneline --decorate";
    glog = "git log --oneline --decorate --graph";
    gloga = "git log --oneline --decorate --graph --all";

    # --- Stash ---
    gst = "git stash";
    gstc = "git stash clear";
    gstl = "git stash list";
    gstp = "git stash pop";

    # --- Undo ---
    grh = "git reset";
    grhh = "git reset --hard";
    guncommit = "git reset --soft HEAD~1";
  };
}
