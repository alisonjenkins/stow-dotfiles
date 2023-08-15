#!/bin/bash
set -euo pipefail

# Ensure software is installed
if [ -f /etc/arch-release ]; then
  PACKAGES=(
    alacritty
    aria2
    asdf-vm-git
    aws-session-manager-plugin
    aws-vault
    azure-cli
    discord
    dive-bin
    docker
    drawio-desktop-bin
    exa
    fd
    freeplane
    git
    gnu-netcat
    haveged
    jq
    kubecm-git
    logseq-desktop-wayland-bin
    luarocks
    mold
    mosh
    neovim
    nnn
    perimeter81
    pwgen
    python-pip
    ripgrep
    rustup
    sccache
    seahorse
    slack-desktop
    starship
    steam
    stow
    tig
    tilt-bin
    tmux
    ttf-hack-nerd
    xclip
    zoxide
    zsh
  )

  declare -a INSTALL_PACKAGES
  INSTALL_PACKAGES=()

  set +e
  for PACKAGE in "${PACKAGES[@]}"; do
    if ! pacman -Qi "$PACKAGE" &>/dev/null; then
      INSTALL_PACKAGES+=("$PACKAGE")
    fi
  done
  set -e

  # Install paru if it is missing
  set +e
  if ! command -v paru &>/dev/null; then
    curl https://aur.archlinux.org/cgit/aur.git/snapshot/paru.tar.gz -o - | tar xvf -C /tmp/
    cd /tmp/paru
    makepkg -si
  fi
  set -e

  if [ "${#INSTALL_PACKAGES[@]}" -gt 0 ]; then
    paru --noconfirm -S "${INSTALL_PACKAGES[@]}"
  fi

  # # pip packages
  # declare -a PIP_PACKAGES_INSTALLED
  # declare -a PIP_PACKAGES_TO_INSTALL
  # PIP_PACKAGES_INSTALLED=($(pip list))
  #
  # PIP_PACKAGES_TO_INSTALL=(
  #   git-remote-codecommit
  #   neovim
  # )
  #
  # for PACKAGE in "${PIP_PACKAGES_TO_INSTALL[@]}"; do
  #   if ! echo "${PIP_PACKAGES_INSTALLED[@]}" | grep -q "$PACKAGE" &>/dev/null; then
  #     pip install "$PACKAGE"
  #   fi
  # done

  # gem packages
  # declare -a GEM_PACKAGES_INSTALLED
  # declare -a GEM_PACKAGES_TO_INSTALL
  # GEM_PACKAGES_INSTALLED=($(gem list))
  #
  # GEM_PACKAGES_TO_INSTALL=(
  #   neovim
  # )
  #
  # for PACKAGE in "${GEM_PACKAGES_TO_INSTALL[@]}"; do
  #   if ! echo "${GEM_PACKAGES_INSTALLED[@]}" | grep -q "$PACKAGE" &>/dev/null; then
  #     gem install "$PACKAGE"
  #   fi
  # done
  #
  # # npm packages
  # declare -a NPM_PACKAGES_INSTALLED
  # declare -a NPM_PACKAGES_TO_INSTALL
  # NPM_PACKAGES_INSTALLED=($(npm list))
  # NPM_PACKAGES_TO_INSTALL=(
  #   neovim
  # )
  #
  # for PACKAGE in "${NPM_PACKAGES_TO_INSTALL[@]}"; do
  #   if ! echo "${NPM_PACKAGES_INSTALLED[@]}" | grep -q "$PACKAGE" &>/dev/null; then
  #     npm install -g "$PACKAGE"
  #   fi
  # done
fi

# Ensure tmux plugin manager is installed
mkdir -p ~/.tmux/plugins
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

stow -t "$HOME" alacritty
stow -t "$HOME" bash
stow -t "$HOME" curl/
stow -t "$HOME" git
stow -t "$HOME" hyprland/
stow -t "$HOME" k9s/
stow -t "$HOME" neovim
stow -t "$HOME" scripts
stow -t "$HOME" starship
stow -t "$HOME" systemd/
stow -t "$HOME" tig/
stow -t "$HOME" tmux
stow -t "$HOME" wezterm/
stow -t "$HOME" wireplumber/
stow -t "$HOME" zsh/
