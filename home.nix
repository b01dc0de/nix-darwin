{ pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
  home.username = "cka";
  home.homeDirectory = "/Users/cka";

  home.packages = with pkgs; [];

  # Bash:
  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.bash.initExtra = ''fastfetch'';
  programs.bash.shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l --color=auto";
      la = "ls -lA --color=auto";
  };

  # Ghostty:
  home.file.".config/ghostty/config".source = ./cfg/ghostty/config;
}
