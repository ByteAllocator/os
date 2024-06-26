{ config, pkgs, lib, ... }: let
  hyprland = (import "${flake-compat}/default.nix" {
    src = builtins.fetchGit {
      url = "https://github.com/hyprwm/Hyprland.git";
      submodules = true;
    };
  }).defaultNix;
in {
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}
