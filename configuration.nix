# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  # Fix a security hole in place for backwards compatibility. See desc in
  # nixpkgs/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix
  boot.loader.systemd-boot.editor = false;
  # Limit number of generations to display in boot menu
  boot.loader.systemd-boot.  configurationLimit = 10;
  # This is usually set to true, but set to false because I couldn't install without it
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.timeout = 1;
  # Nothing in /tmp should survive a reboot
  boot.tmpOnTmpfs = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.networkmanager.enable = true; # Enables nmcli
  networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  networking.wireless.networks = {
    "Guest-5G" = {
      psk = "12345rogers";
    };
    "Guest" = {
      psk = "12345rogers";
    };
  };

  hardware.bluetooth.enable = true; # Enables bluetooth

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.enp14s0.useDHCP = true;
  networking.interfaces.wlp10s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # Use the keyboard layout configured for X11 (below) in the TTY
    useXkbConfig = true;
  };

  time.timeZone = "America/Toronto";

  services.xserver.videoDrivers = [ "nvidia" ];
  # Fix flickering on gray surfaces when moving the mouse
  services.xserver.screenSection = ''
    Option "metamodes" "nvidia-auto-select +0+0 { ForceCompositionPipeline = On }"
  '';

  # Fix steam
  hardware.opengl.driSupport32Bit = true;
 

  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget 
    git
    killall
    unzip
    sshfs
    gnumake

    file

    jq
    tmux
    htop

    google-chrome
    steam
    # Fix steam
    xorg.libxcb

    # Remap escape key to tilde
    xorg.xmodmap

    vim neovim

    # Doom Emacs and its dependencies
    emacs
    ripgrep fd
    imagemagick
    zstd
    # :checkers spell
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    # :checkers grammar
    languagetool
    # :lang javascript
    nodePackages.javascript-typescript-langserver
    # :lang rust
    rustfmt
    rls
    # :tools lookup & :lang org +roam
    sqlite
    # :lang latex & :lang org (latex previews)
    texlive.combined.scheme-medium
  ];

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      roboto
      source-code-pro
      dina-font

      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      fira-code
      fira-code-symbols

      liberation_ttf
      mplus-outline-fonts
      proggyfonts

      emacs-all-the-icons-fonts
    ];
    fontconfig = {
      penultimate.enable = false;
      defaultFonts = {
        serif = [ "Roboto" ];
        sansSerif = [ "Roboto" ];
        monospace = [ "Source Code Pro" ];
      };
    };
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us,ru,us";
  services.xserver.xkbVariant = "dvp,,";
  services.xserver.xkbOptions = "caps:escape,grp:shifts_toggle";
  services.xserver.autoRepeatDelay = 180;
  services.xserver.autoRepeatInterval = 30;
  # This doesn't work, using ~/.Xmodmap instead.
  #services.xserver.displayManager.sessionCommands = ''
  #  xmodmap -e "keycode 9 = dollar asciitilde"
  #'';

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable i3 with GNOME
  #services.xserver.desktopManager.gnome3.enable = true;
  #services.xserver.desktopManager.xterm.enable = false;
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.windowManager.i3.enable = true;
  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.boris = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };
  # Don't prompt users that can use `sudo` for their password.
  security.sudo.wheelNeedsPassword = false; 

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}

