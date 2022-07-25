#!/bin/bash
set -euo pipefail

# Ensure software is installed
if [ -f /etc/arch-release ]; then
  PACKAGES=(
    alacritty
    asdf-vm
    aws-session-manager-plugin
    aws-vault
    azure-cli
    discord
    drawio
    exa
    fd
    freeplane
    git
    haveged
    jq
    kubecm-git
    logseq-desktop
    neovim
    nerd-fonts-hack
    nnn
    perimeter81
    python-pip
    ripgrep
    rustup
    seahorse
    slack-desktop
    steam
    tmux
    zoxide
    zsh
  )

  declare -a INSTALL_PACKAGES
  INSTALL_PACKAGES=()

  set +e
  for PACKAGE in "${PACKAGES[@]}"; do
    if ! pacman -Qi "$PACKAGE" &> /dev/null; then
      INSTALL_PACKAGES+=("$PACKAGE")
    fi
  done
  set -e

  # Install paru if it is missing
  set +e
  if ! command -v paru &> /dev/null; then
    curl https://aur.archlinux.org/cgit/aur.git/snapshot/paru.tar.gz -o - | tar xvf -C /tmp/
    cd /tmp/paru
    makepkg -si
  fi
  set -e

  if [ "${#INSTALL_PACKAGES[@]}" -gt 0 ]; then
    paru --noconfirm -S "${INSTALL_PACKAGES[@]}"
  fi

  ASDF_PLUGINS_INSTALLED=$(asdf plugin list)
  declare -a ASDF_PLUGINS_TO_INSTALL
  ASDF_PLUGINS_TO_INSTALL=(
    awscli
    direnv
    github-cli
    just
    kubectl
    kubectx
    terraform
    terraform-docs
    tflint
    tfsec
  )

  # Ensure all listed asdf plugins are installed
  # echo "${ASDF_PLUGINS_INSTALLED[@]}"
  for PLUGIN in "${ASDF_PLUGINS_TO_INSTALL[@]}"; do
    echo "Checking $PLUGIN"
    if ! echo "${ASDF_PLUGINS_INSTALLED[@]}" | grep -q "$PLUGIN" &> /dev/null; then
      echo "Attempting to install plugin: $PLUGIN"
      asdf plugin add "$PLUGIN"
    fi
  done

  ASDF_PLUGINS_INSTALLED=($(asdf plugin list))
  declare -A ASDF_TOOL_VERSIONS

  ASDF_TOOL_VERSIONS=(
    [just]="0.9.4"
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

  # ensure codecommit grc is installed
  pip install git-remote-codecommit
fi

# Ensure tmux plugin manager is installed
mkdir -p ~/.tmux/plugins
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

stow -t $HOME alacritty
stow -t $HOME bash
stow -t $HOME curl/
stow -t $HOME git
stow -t $HOME neovim
stow -t $HOME scripts
stow -t $HOME systemd/
stow -t $HOME tig/
stow -t $HOME tmux
stow -t $HOME zsh/
