{
  programs.zsh.shellAliases = {
    clean-os = "nh clean all";
    fnf = "git ls-files '*.nix' | xargs -r nix run nixpkgs#alejandra --"; # Format Nix Files
    nix-store-repair = "sudo nix-store --repair --verify --check-contents";
    updatehm = "nix flake update; export NIXPKGS_ALLOW_UNFREE=1; home-manager switch --flake . --impure";
    # darwin: rebuild the nix-darwin system instead of nixos-rebuild
    updatenix = "sudo nix flake update; sudo darwin-rebuild switch --flake ~/.config/nix-darwin#a --show-trace -L";
    # Dropped (Arch-only): rip / riplong (expac)
  };
}
