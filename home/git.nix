{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    # signing.key = "A4AB76840BB2901A";   # key not present on this Mac; signing disabled
    #      signing.signByDefault = true;
    settings = {
      user = {
        name = "Marin Kitagawa";
        email = "49131888+Marin-Kitagawa@users.noreply.github.com";
      };
      # Commit signing disabled on darwin (no GPG/SSH signing key imported here).
      commit.gpgsign = false;
      #        gpg.format = "ssh";
      #        user.signingkey = "./id_ed25519.pub";
      #        gpg.ssh.allowedSignersFile = "./allowed_signers";
      # macOS keychain credential helper (upstream used libsecret on Linux).
      credential.helper = "osxkeychain";
      # Use the GitHub CLI as the credential helper for github.com / gists.
      # The leading "" clears inherited helpers so gh is authoritative (this is
      # what `gh auth setup-git` would write, but done declaratively since the
      # generated ~/.config/git/config is a read-only Nix symlink).
      credential."https://github.com".helper = [
        ""
        "${pkgs.gh}/bin/gh auth git-credential"
      ];
      credential."https://gist.github.com".helper = [
        ""
        "${pkgs.gh}/bin/gh auth git-credential"
      ];

      #git-delta configuration
      core = {pager = "delta";};
      interactive = {diffFilter = "delta --color-only";};
      delta = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
        true-color = "always";
      };
      merge = {conflictstyle = "diff3";};
      diff = {colorMoved = "default";};
    };
    includes = [
      {
        # Use the work identity for any repo under ~/Work (and all subfolders).
        path = "~/.gitconfig-work";
        condition = "gitdir:~/Work/";
      }
    ];
  };
}
