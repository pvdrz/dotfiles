{ config, pkgs, ... }:

with pkgs;
let 
  unstable = import <unstable> {};
  py-pkgs = python-packages: with python-packages; [
    pygments
    numpy
    scipy
    matplotlib
    pandas
  ]; 
  my-python = python3.withPackages py-pkgs;
in {
  imports =
    [
      ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "offensive-bias";

    i18n = {
      consoleFont = "Lat2-Terminus16";
      consoleKeyMap = "la-latin1";
      defaultLocale = "en_US.UTF-8";
    };

    time.timeZone = "America/Bogota";

    sound.enable = true;
    hardware.pulseaudio.enable = true;

    services.xserver.enable = true;
    services.xserver.layout = "latam";

    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome3.enable = true;

    environment.gnome3.excludePackages = with pkgs.gnome3; [
      epiphany gucharmap 
      totem vino yelp gnome-contacts gnome-system-monitor simple-scan
      gnome-user-docs evolution gedit gnome-music gnome-photos nautilus-sendto
      dconf-editor vinagre  gnome-weather gnome-logs gnome-maps 
      gnome-characters gnome-calendar accerciser gnome-nettool 
      gnome-getting-started-docs gnome-packagekit gnome-software gnome-todo 
      gnome-usage
    ];

    services.gnome3.gnome-documents.enable = pkgs.lib.mkForce false;
    services.gnome3.evolution-data-server.enable = pkgs.lib.mkForce false;

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      neovim
      fish
      htop
      firefox
      adapta-gtk-theme
      unstable.rustup
      my-python
      yarn
      nodejs
      texlive.combined.scheme-full
      gnomeExtensions.appindicator
      gnomeExtensions.no-title-bar
    ];

    fonts.fonts = with pkgs; [
      source-code-pro
    ];

    programs.fish.enable = true;

    users.users.christian = {
      isNormalUser = true;
      home = "/home/christian";
      description = "Christian Poveda";
      shell = pkgs.fish;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [ steam ];
    };

    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio.support32Bit = true;

    system.stateVersion = "18.09";
  }
