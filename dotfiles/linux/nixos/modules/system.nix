{ config, pkgs, ... }: {
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  hardware.xpadneo.enable = true; # enables support for the Xbox One controller

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";  # for UEFI systems
          efiSupport = true;
          useOSProber = false;  # if you want to detect other OS
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";  # your EFI mount point
      };
    };

    };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";

  # kanshi systemd service
  # we don't run Sway itself as a systemd service.
  # There are auxiliary daemons that we do want to run
  # as systemd services, for example Kanshi
  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    environment = {
      WAYLAND_DISPLAY="wayland-1";
      DISPLAY = ":0";
    }; 
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };

}
