{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.media;
in
{
  options.features.gui.media.enable = mkEnableOption "enable media features";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      amf
      blueberry
      ffmpeg_6-full
      gst_all_1.gstreamer
      gst_all_1.gst-vaapi
      handbrake
      inkscape
      libation
      #makemkv
      pamixer
      pavucontrol
      qpwgraph
      v4l-utils
      plexamp
    ];

    programs = {
      mpv = {
        enable = true;
        bindings = {
          WHEEL_UP = "seek 10";
          WHEEL_DOWN = "seek -10";
        };
        config = {
          profile = "gpu-hq";
          ytdl-format = "bestvideo+bestaudio";
        };
      };
    };
  };
}
