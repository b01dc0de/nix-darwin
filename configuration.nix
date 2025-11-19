{ pkgs, config, ... }:

{
  # Enable flakes:
  nix.settings.experimental-features = "nix-command flakes";

  # Allow unfree software:
  nixpkgs.config.allowUnfree = true;

  # Users:
  users.users.cka = {
    name = "cka";
    home = "/Users/cka";
  };

  # Packages:
  environment.systemPackages = with pkgs; [
    alt-tab-macos
    fastfetch
    firefox
    git
    neovim
    neovide
    obsidian
    raycast
    rectangle
    spotify
    vim
    vscode
  ];

  # Homebrew:
  homebrew = {
    enable = true;
    brews = [
      "mas"
    ];
    casks = [
      "chromium"
      "karabiner-elements"
      "ghostty"
    ];
    masApps = { };
    onActivation.cleanup = "zap";
  };

  # Fonts:
  fonts.packages = with pkgs; [
    nerd-fonts.blex-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    nerd-fonts.sauce-code-pro
    nerd-fonts.symbols-only
    nerd-fonts.terminess-ttf
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.ubuntu-sans
  ];

  # Configure dock:
  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0;
    autohide-time-modifier = 0.2;
    expose-animation-duration = 0.2;
    launchanim = false;
    persistent-apps = [
      "/Applications/Ghostty.app"
      "${pkgs.firefox}/Applications/Firefox.app"
      "${pkgs.vscode}/Applications/Visual Studio Code.app"
      "${pkgs.obsidian}/Applications/Obsidian.app"
      "${pkgs.spotify}/Applications/Spotify.app"
    ];
    show-recents = false;
    show-process-indicators = true;
    tilesize = 48;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Set system primary user:
  system.primaryUser = "cka"; # Necessary for homebrew to work
}
