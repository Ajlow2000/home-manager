{ config, lib, pkgs, ... }:
let 
    cfg = config.my_hypr;
in {
    options = {
        my_hypr.enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
        };
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            wayland-protocols
            wayland-utils
            waybar
            wl-clipboard
            swww
            feh
            wofi
            light
        ];

        programs.hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };
}
