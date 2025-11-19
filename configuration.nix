{ pkgs, ... }:

{
  # Packages:
  environment.systemPackages = with pkgs; [
    firefox
    git
    vim
  ];

  # Enable flakes:
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
