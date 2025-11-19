{ pkgs, config, ... }:

{
  # Enable flakes:
  nix.settings.experimental-features = "nix-command flakes";

  # Allow unfree software:
  nixpkgs.config.allowUnfree = true;

  # Packages:
  environment.systemPackages = with pkgs; [
    firefox
    git
    obsidian
    vim
  ];

  # Homebrew:
  homebrew = {
    enable = true;
    brews = [ ];
    casks = [ ];
    masApps = { };
    onActivation.cleanup = "zap";
  };


  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Set system primary user:
  system.primaryUser = "cka"; # Necessary for homebrew to work
}
