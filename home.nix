{ pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
  home.username = "cka";
  home.homeDirectory = "/Users/cka";

  home.packages = with pkgs; [];

  # Ghostty:
  home.file.".config/ghostty/config".source = ./cfg/ghostty/config;

  # Oh My Posh:
  programs.oh-my-posh.enable = true;
  programs.oh-my-posh.enableZshIntegration = true;

  # Zsh:
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.initContent = ''
    eval "$(oh-my-posh init zsh)"
  '';
}
