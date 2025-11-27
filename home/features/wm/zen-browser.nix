{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.wm.zen-browser;
in
{
  options.features.wm.zen-browser.enable = mkEnableOption "enable zen-browser";

  config = mkIf cfg.enable {
    programs = {
      zen-browser = {
        enable = true;
        nativeMessagingHosts = [ pkgs.firefoxpwa ];
        policies =
          let
            mkLockedAttrs = builtins.mapAttrs (
              _: value: {
                Value = value;
                Status = "locked";
              }
            );
            mkExtensionSettings = builtins.mapAttrs (
              _: pluginId: {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
                installation_mode = "force_installed";
              }
            );
          in
          {
            AutofillAddressEnabled = true;
            AutofillCreditCardEnabled = false;
            DisableAppUpdate = true;
            DisableFeedbackCommands = true;
            DisableFirefoxStudies = true;
            DisablePocket = true;
            DisableTelemetry = true;
            DontCheckDefaultBrowser = true;
            NoDefaultBookmarks = true;
            OfferToSaveLogins = false;
            EnableTrackingProtection = {
              Value = true;
              Locked = true;
              Cryptomining = true;
              Fingerprinting = true;
            };
            Preferences = mkLockedAttrs {
              "browser.tabs.warnOnClose" = false;
            };
            ExtensionSettings = mkExtensionSettings {
              "wappalyzer@crunchlabz.com" = "wappalyzer";
              "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = "github-file-icons";
              "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = "vimium-ff";
            };
          };
      };
    };
  };
}
