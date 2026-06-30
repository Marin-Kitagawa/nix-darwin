{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    #./atuin.nix
    ./direnv.nix
    ./git.nix
    # ./kitty.nix
    ./neovim.nix
    # ./ghostty.nix
    #./nixvim.nix
    ./vscode.nix
    ./wezterm.nix
    #./zen-browser.nix
    ./zoxide.nix
    ./zsh/zsh.nix
  ];

  home.username = "astraeavalentina";
  home.homeDirectory = "/Users/astraeavalentina";

  # Home Manager release this config targets. Do not change casually.
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
}
