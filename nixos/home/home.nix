{
  config,
  lib,
  pkgs,
  ...
}:

with lib.hm.gvariant;

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pedro";
  home.homeDirectory = "/home/pedro";

  imports = [
    ./programs/gnome.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # shell
    zsh
    # dev tools
    bat
    bruno
    # cloudflared
    curl
    delta
    difftastic
    eza
    fd
    fzf
    gh
    git
    gitleaks
    jq
    k6
    # stripe-cli
    # mise
    neovim
    ripgrep
    scc
    shellcheck
    shfmt
    wget
    yazi
    zoxide
    # dev utils
    bison
    fontforge
    makeWrapper
    autoconf
    automake
    btop
    fop
    # gcc
    zlib
    gnumake
    libiconv
    libtool
    hyperfine
    inotify-tools
    pkg-config
    podman
    podman-compose
    speedtest-cli
    unzip
    watchman
    # tools
    ffmpeg-full
    imagemagick
    impression
    inkscape
    libreoffice
    sc-im
    # system tools
    neofetch
    onefetch
    cpufetch

    # build Erlang/OTP with Kerl
    flex
    gnused
    libGL
    libGLU
    libressl
    ncurses
    openjdk
    # openssl
    perl
    termcap
    unixODBC
    wxGTK32
    wxc

    # gnome
    wmctrl
    gnome-tweaks
    ulauncher
    wl-clipboard
    copyq

    # Gnome Extensions
    gnomeExtensions.auto-move-windows
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pop-shell
    gnomeExtensions.space-bar
    gnomeExtensions.system-monitor
    gnomeExtensions.caffeine

    elixir_1_18
    erlang_27
    # ruby_3_4
    # nodejs_23
    go

    file
    image_optim
    wkhtmltopdf
    # jpegoptim
    # optipng
    # pngquant
    # nodePackages.svgo
    # gifsicle

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
