{
  inputs,
  pkgs,
  ...
}: {
  programs.zen-browser = {
    enable = true;
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = false;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    profiles = {
      default = {
        extensions = {
          packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
            ublock-origin
          ];
        };
        mods = [
          "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
        ];
        search = {
          force = true; # Needed for nix to overwrite search settings on rebuild
        };
        settings = {
          browser = {
            tabs = {
              warnOnClose = false;
            };
            download = {
              panel = {
                shown = false;
              };
            };
          };
        };
        bookmarks = {
          force = true; # Required for nix to overwrite bookmarks on rebuild
          settings = [
            {
              name = "Nix sites";
              toolbar = false;
              bookmarks = [
                {
                  name = "homepage";
                  url = "https://nixos.org/";
                }
                {
                  name = "wiki";
                  tags = [
                    "wiki"
                    "nix"
                  ];
                  url = "https://wiki.nixos.org/";
                }
              ];
            }
          ];
        };
        spaces = {};
      };
    };
  };
}
