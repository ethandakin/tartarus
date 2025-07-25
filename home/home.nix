{ config, pkgs, ... }:

{
    imports = [
        ../modules/hyprland.nix
    ];

    home.username = "ethan";
    home.homeDirectory = "/home/ethan";

    home.packages = with pkgs; [
        fastfetch
    ];

    programs.git = {
        enable = true;
        userName = "ethan";
        userEmail = "ethand@outlook.com.au";
    };

    programs.wofi = {
        enable = true;
    };

    home.stateVersion = "25.05";
}