{ pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
  home.username = "cka";
  home.homeDirectory = "/Users/cka";

  home.packages = with pkgs; [];

  # Ghostty:
  home.file.".config/ghostty/config".source = ./cfg/ghostty/config;

  # Bash:
  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.bash.initExtra = ''fastfetch'';
  programs.bash.shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l --color=auto";
      la = "ls -lA --color=auto";
  };

  # Oh My Posh:
  #programs.oh-my-posh.enable = true;
  #programs.oh-my-posh.enableZshIntegration = true;

  # Zsh:
  #programs.zsh.enable = true;
  #programs.zsh.enableCompletion = true;
  #programs.zsh.autosuggestion.enable = true;
}
