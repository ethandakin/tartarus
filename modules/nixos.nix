{ pkgs, inputs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    vscode
  ];

  system.stateVersion = "24.05";
}