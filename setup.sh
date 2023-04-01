#!/bin/bash
set -euo pipefail

# Ensure software is installed
if [ -f /etc/arch-release ]; then
  PACKAGES=(
    alacritty
    aria2
    asdf-vm
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
    haveged
    jq
    kubecm-git
    logseq-desktop
    luarocks
    mold
    mosh
    neovim
    nerd-fonts-hack
    nnn
    perimeter81
    pwgen
    python-pip
    ripgrep
    rustup
    sccache
    seahorse
    slack-desktop
    steam
    stow
    tig
    tilt-bin
    tmux
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

  set +e
  ASDF_PLUGINS_INSTALLED=($(asdf plugin list 2>&1))
  set -e
  declare -a ASDF_PLUGINS_TO_INSTALL
  ASDF_PLUGINS_TO_INSTALL=(
    awscli
    direnv
    flux2
    github-cli
    helm
    java
    just
    k9s
    kubectl
    kubectx
    maven
    nodejs
    packer
    sops
    terraform
    terraform-docs
    tflint
    tfsec
  )

  echo "ASDF Plugins installed: ${ASDF_PLUGINS_INSTALLED[@]}"

  # Ensure all listed asdf plugins are installed
  for PLUGIN in "${ASDF_PLUGINS_TO_INSTALL[@]}"; do
    echo "Checking $PLUGIN"
    if ! echo "${ASDF_PLUGINS_INSTALLED[@]}" | grep -q "$PLUGIN" &>/dev/null; then
      echo "Attempting to install plugin: $PLUGIN"
      asdf plugin add "$PLUGIN"
    fi
  done

  ASDF_PLUGINS_INSTALLED=($(asdf plugin list))
  declare -A ASDF_TOOL_VERSIONS

  ASDF_TOOL_VERSIONS=(
    [java]="corretto-11.0.16.8.1"
    [just]="1.3.0"
    [maven]="3.8.6"
  )

  # Ensure the latest versions of software are installed via asdf
  for plugin in "${ASDF_PLUGINS_INSTALLED[@]}"; do
    if [ "${ASDF_TOOL_VERSIONS[$plugin]+exists}" ]; then
      INSTALL_VERSION=${ASDF_TOOL_VERSIONS[$plugin]}
    else
      INSTALL_VERSION=$(asdf list all "$plugin" | tail -n1)
    fi
    asdf install "$plugin" "$INSTALL_VERSION"
    asdf global "$plugin" "$INSTALL_VERSION"
  done

  # pip packages
  declare -a PIP_PACKAGES_INSTALLED
  declare -a PIP_PACKAGES_TO_INSTALL
  PIP_PACKAGES_INSTALLED=($(pip list))

  PIP_PACKAGES_TO_INSTALL=(
    git-remote-codecommit
    neovim
  )

  for PACKAGE in "${PIP_PACKAGES_TO_INSTALL[@]}"; do
    if ! echo "${PIP_PACKAGES_INSTALLED[@]}" | grep -q "$PACKAGE" &>/dev/null; then
      pip install "$PACKAGE"
    fi
  done

  # gem packages
  declare -a GEM_PACKAGES_INSTALLED
  declare -a GEM_PACKAGES_TO_INSTALL
  GEM_PACKAGES_INSTALLED=($(gem list))

  GEM_PACKAGES_TO_INSTALL=(
    neovim
  )

  for PACKAGE in "${GEM_PACKAGES_TO_INSTALL[@]}"; do
    if ! echo "${GEM_PACKAGES_INSTALLED[@]}" | grep -q "$PACKAGE" &>/dev/null; then
      gem install "$PACKAGE"
    fi
  done

  # npm packages
  declare -a NPM_PACKAGES_INSTALLED
  declare -a NPM_PACKAGES_TO_INSTALL
  NPM_PACKAGES_INSTALLED=($(npm list))
  NPM_PACKAGES_TO_INSTALL=(
    neovim
  )

  for PACKAGE in "${NPM_PACKAGES_TO_INSTALL[@]}"; do
    if ! echo "${NPM_PACKAGES_INSTALLED[@]}" | grep -q "$PACKAGE" &>/dev/null; then
      npm install -g "$PACKAGE"
    fi
  done
fi

# Ensure tmux plugin manager is installed
mkdir -p ~/.tmux/plugins
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

stow -t "$HOME" alacritty
stow -t "$HOME" bash
stow -t "$HOME" curl/
stow -t "$HOME" git
stow -t "$HOME" neovim
stow -t "$HOME" scripts
stow -t "$HOME" starship
stow -t "$HOME" systemd/
stow -t "$HOME" tig/
stow -t "$HOME" tmux
stow -t "$HOME" wezterm/
stow -t "$HOME" wireplumber/
stow -t "$HOME" zsh/
