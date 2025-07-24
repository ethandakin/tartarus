{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./modules/nvidia.nix
    ];

    users.users.ethan = {
        isNormalUser = true;
        description = "ethaana";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
            
        ];
    };

    system.stateVersion = "24.05";
}