{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.gui.zen-browser;
in
{
  options.features.gui.zen-browser.enable = mkEnableOption "enable zen-browser";

  config = mkIf cfg.enable {
    xdg.mimeApps =
      let
        associations = builtins.listToAttrs (
          map
            (name: {
              inherit name;
              value =
                let
                  zen-browser = inputs.zen-browser.packages.${system}.twilight;
                in
                zen-browser.meta.desktopFile;
            })
            [
              "application/x-extension-shtml"
              "application/x-extension-xhtml"
              "application/x-extension-html"
              "application/x-extension-xht"
              "application/x-extension-htm"
              "x-scheme-handler/unknown"
              "x-scheme-handler/mailto"
              "x-scheme-handler/chrome"
              "x-scheme-handler/about"
              "x-scheme-handler/https"
              "x-scheme-handler/http"
              "application/xhtml+xml"
              "application/json"
              "text/plain"
              "text/html"
            ]
        );
      in
      {
        associations.added = associations;
        defaultApplications = associations;
      };
    programs = {
      zen-browser = {
        enable = true;
        suppressXdgMigrationWarning = true;
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
              "{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}" = "adblock-plus";
            };
          };
      };
    };
  };
}
