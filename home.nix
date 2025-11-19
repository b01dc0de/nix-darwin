{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
  home.username = "cka";
  home.homeDirectory = "/Users/cka";

  home.packages = with pkgs; [];
}
