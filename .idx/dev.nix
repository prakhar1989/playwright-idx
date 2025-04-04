# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs_20
    pkgs.playwright
    pkgs.glib
    pkgs.gtk3
    pkgs.udev
    # pkgs.libxss
    # pkgs.xorg.libXtst
    pkgs.alsa-lib
    pkgs.cups
    pkgs.fontconfig
    pkgs.freetype
    pkgs.cairo
    pkgs.at-spi2-core
    pkgs.at-spi2-atk
    pkgs.dbus
    pkgs.expat

    # Graphics and rendering libraries
    pkgs.mesa # Provides libgbm, libEGL, libGL
    pkgs.libdrm
    pkgs.cairo
    pkgs.pango
    pkgs.xorg.libxcb
    pkgs.xorg.libX11
    pkgs.xorg.libXcursor
    pkgs.xorg.libXi
    pkgs.xorg.libXcomposite
    pkgs.xorg.libXdamage
    pkgs.xorg.libXext
    pkgs.xorg.libXfixes
    pkgs.xorg.libXrandr
    pkgs.xorg.libXrender
    pkgs.xorg.libXtst
    pkgs.xorg.libxshmfence # Often needed by Chromium/Mesa interaction
    pkgs.libxkbcommon
    pkgs.gdk-pixbuf-xlib
    pkgs.gdk-pixbuf
    # pkgs.webkitgtk_6_0
    # Networking and security
    pkgs.nss # Network Security Services
    pkgs.nspr # Netscape Portable Runtime (dependency for nss)
    pkgs.cups # Common Unix Printing System (often needed for PDF generation/printing simulation)
    pkgs.openssl
    pkgs.dbus
    pkgs.chromium
    pkgs.libuv
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        npm-install = "npm ci --no-audit --prefer-offline --no-progress --timing";
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
    previews = {
    };
  };
}