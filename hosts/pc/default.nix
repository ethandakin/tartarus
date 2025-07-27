{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../modules/boot.nix
        ../../modules/networking.nix
        ../../modules/locale.nix
        ../../modules/nixos.nix
        ../../modules/nvidia.nix
        ../../modules/audio.nix
        ../../modules/wayland.nix
    ];

    programs.steam = {
	    enable = true;
	    extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    users.users.ethan = {
        isNormalUser = true;
        description = "ethaana";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [

        ];
    };

}