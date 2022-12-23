{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../common
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      memtest86.enable = true;
      consoleMode = "auto";
    };

    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "serow";

  # My configuration specific settings
  hsys = {
    enableDwm = true;
    getDevTools = true;
    laptop = true;
    virtualisation = true;
    backups = {
      enable = true;
      repo = "zh2137@zh2137.rsync.net:borg";
    };
    tailscale = {
      enable = true;
      exitNode = true;
      ssh = true;
    };
  };

  system.stateVersion = "21.11";
}
