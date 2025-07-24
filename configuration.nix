{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./modules/nvidia.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "nixos";

    networking.networkmanager.enable = true;

    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        jack.enable = true;

        extraConfig.pipewire = {
            "context.properties" = {
                "default.clock.rate" = 48000;
                "default.clock.quantum" = 2048;
                "default.clock.min-quantum" = 2048;
                "default.clock.max-quantum" = 8192;
            };
        };
    };

    time.timeZone = "Australia/Sydney";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_AU.UTF-8";
        LC_IDENTIFICATION = "en_AU.UTF-8";
        LC_MEASUREMENT = "en_AU.UTF-8";
        LC_MONETARY = "en_AU.UTF-8";
        LC_NAME = "en_AU.UTF-8";
        LC_NUMERIC = "en_AU.UTF-8";
        LC_PAPER = "en_AU.UTF-8";
        LC_TELEPHONE = "en_AU.UTF-8";
        LC_TIME = "en_AU.UTF-8";
    };

    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    nixpkgs.config.allowUnfree = true;

    users.users.ethan = {
        isNormalUser = true;
        description = "ethaana";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [

        ];
    };

    environment.systemPackages = with pkgs; [
        git
    ];

    system.stateVersion = "24.05";
}