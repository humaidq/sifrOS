{
  config,
  pkgs,
  vars,
  ...
}: {
  networking = {
    computerName = "takin";
    hostName = "takin";
  };
  home-manager.users.${vars.user} = {
    home.stateVersion = "23.05";
  };

  users.users.${vars.user} = {
    home = "/Users/humaid";
  };

  nix = {
    #gc = {
    #  automatic = true;
    #  #dates = "weekly"; #use interval instead
    #  options = "--delete-older-than 60d";
    #  user = "root";
    #};

    settings.experimental-features = ["nix-command" "flakes"];
    extraOptions = ''
      auto-optimise-store = true
    '';
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        KeyRepeat = 1;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
      dock = {
        orientation = "bottom";
        tilesize = 40;
      };
    };

    stateVersion = 4;
  };

  programs = {
    zsh.enable = true;
  };
  services = {
    nix-daemon.enable = true;
  };
  homebrew = {
    enable = false;
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };
    brews = [
      "jython"
      "python@3.11"
      "tmux"
    ];
    casks = [
      "vlc"
      "rectangle-pro"
      "slack"
      "stats"
      "transmission"
      "lulu"
      "knockknock"
      "iterm2"
      "firefox"
      "bartender"
      "coconutbattery"
      "docker"
      "eloston-chromium" # ungoogled-chromium
      "logi-options-plus"
      "diffusionbee"
    ];
  };
}
