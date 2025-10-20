{
  pkgs,
  inputs,
  host,
  ...
}:
{

  programs = {
    hyprland = {
      enable = true;
      withUWSM = false;
      #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland; #hyprland-git
      #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland; #xdph-git

      portalPackage = pkgs.xdg-desktop-portal-hyprland; # xdph none git
      xwayland.enable = true;
    };
    zsh.enable = true;
    firefox.enable = true;
    waybar.enable = true;
    hyprlock.enable = true;
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    git.enable = true;
    tmux.enable = true;
    nm-applet.indicator = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };

    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [
      exo
      mousepad
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];

  };
  services.tailscale.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # Hyprland Stuff
    hypridle
    hyprpolkitagent
    pyprland
    #uwsm
    hyprlang
    hyprshot
    hyprcursor
    mesa
    nwg-displays
    nwg-look
    waypaper
    hyprland-qt-support # for hyprland-qt-support

    #  Apps
    loupe
    appimage-run
    bc
    brightnessctl
    bottom
    baobab
    btrfs-progs
    cmatrix
    dua
    duf
    cava
    cargo
    clang
    cmake
    cliphist
    curl
    dysk
    eog
    eza
    findutils
    figlet
    ffmpeg
    fd
    feh
    file-roller
    glib # for gsettings to work
    gsettings-qt
    git
    gnome-system-monitor
    fastfetch
    jq
    gcc
    git
    gnumake
    grim
    grimblast
    gtk-engine-murrine # for gtk themes
    inxi
    imagemagick
    killall
    kdePackages.qt6ct
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum # kvantum
    lazydocker
    libappindicator
    libnotify
    libsForQt5.qtstyleplugin-kvantum # kvantum
    libsForQt5.qt5ct
    obsidian
    qutebrowser
    (mpv.override { scripts = [ mpvScripts.mpris ]; }) # with tray
    nvtopPackages.full
    net-tools
    bind
    openssl # required by Rainbow borders
    opencode
    pciutils
    networkmanagerapplet
    pamixer
    pavucontrol
    playerctl
    kdePackages.polkit-kde-agent-1
    rofi
    slurp
    swappy
    swaynotificationcenter
    swww
    unzip
    wallust
    wdisplays
    wl-clipboard
    wlr-randr
    wlogout
    wget
    xarchiver
    yad
    yazi
    yt-dlp

    (inputs.quickshell.packages.${pkgs.system}.default)
    (inputs.ags.packages.${pkgs.system}.default)

    # Utils
    lua-language-server
    nil # Nix LSP
    nodePackages.bash-language-server
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted # html, css, json, eslint
    nodePackages.yaml-language-server
    nodejs # needed for many LSPs
    stylua # Lua formatter
    black # Python formatter
    nixpkgs-fmt # Nix formatter
    prettierd # Fast prettier daemon
    nodePackages.prettier
    atop
    fzf
    gdu
    glances
    gping
    htop
    hyfetch
    ipfetch
    lolcat
    lsd
    clang-tools
    oh-my-posh
    pfetch
    ncdu
    ncftp
    ripgrep
    socat
    starship
    tree-sitter
    tree-sitter-grammars.tree-sitter-lua
    tree-sitter-grammars.tree-sitter-c
    tree-sitter-grammars.tree-sitter-cpp
    tree-sitter-grammars.tree-sitter-javascript
    tree-sitter-grammars.tree-sitter-typescript
    tree-sitter-grammars.tree-sitter-python
    tree-sitter-grammars.tree-sitter-nix
    tree-sitter-grammars.tree-sitter-bash
    tree-sitter-grammars.tree-sitter-json
    tree-sitter-grammars.tree-sitter-html
    tree-sitter-grammars.tree-sitter-css
    tldr
    ugrep
    unrar
    v4l-utils
    zoxide
    wavemon

    # communications
    vesktop
    signal-desktop
    halloy

    # Development related
    luarocks
    nh

    # Virtuaizaiton
    virt-viewer
    libvirt

    #ebook reader
    epy


    # Terminals
    kitty
    wezterm

  ];
}
