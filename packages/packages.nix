{...}: {
  imports = [
    # ./BlackNix/BlackNix.nix      # excluded per request
    ./development/development.nix
    ./files/files.nix
    # ./hardware/hardware.nix      # Linux-only (bluez, mesa, vulkan, solaar)
    ./media/media.nix
    ./productivity_office/productivity_office.nix
    ./security/security.nix
    ./system/system.nix
    # ./desktop/desktop.nix        # Linux-only (KDE Plasma, GTK/KDE themes)
    ./web_internet/web_internet.nix
  ];
}
