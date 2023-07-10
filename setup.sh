#!/bin/bash
set -euo pipefail

test -d ~/.asdf || git clone https://github.com/asdf-vm/asdf.git ~/.asdf
test -f ~/.asdf/asdf.sh && source ~/.asdf/asdf.sh

# Ensure software is installed
if [ -f /etc/arch-release ]; then
  PACKAGES=(
    alacritty # A cross-platform, GPU-accelerated terminal emulator.
    aria2 # A lightweight multi-protocol & multi-source command-line download utility.
    asdf-vm # A CLI tool that manages multiple runtime versions with a single CLI tool, extendable via plugins.
    # aws-session-manager-plugin # The Session Manager plugin for the AWS CLI, enables you to interact with your Amazon EC2 instances, AWS CloudShell, and AWS Systems Manager Session Manager sessions.
    # aws-vault # A vault for securely storing and accessing AWS credentials in development environments.
    # azure-cli # A set of tools to manage resources on Microsoft's Azure cloud platform from the command line.
    # discord # All-in-one voice and text chat for gamers.
    dive-bin # A tool for exploring each layer in a Docker image.
    docker # A platform that allows developers to package applications into containers, standardizing software delivery.
    drawio-desktop-bin # A diagramming software to create flowcharts and other diagrams, this is the standalone desktop version.
    exa # A modern replacement for 'ls', provides a more aesthetically pleasing and feature-rich directory listing.
    fd # A fast and user-friendly alternative to the traditional 'find' command.
    freeplane # A free and open-source software application that supports thinking, sharing information and getting things done at work.
    git # Distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
    haveged # A simple entropy daemon using the HAVEGE algorithm, designed to keep a sufficient level of entropy in the system.
    jq # A lightweight and flexible command-line JSON processor.
    # kubecm-git # A utility to manage Kubernetes context and namespaces in an easier way.
    logseq-desktop # A local-first, non-linear, outliner notebook for organizing and sharing personal knowledge.
    luarocks # A package manager for Lua modules.
    mold # A modern linker designed to be fast.
    mosh # Mobile Shell that supports roaming and improved interactivity, a replacement for SSH.
    neovim # An extensible text editor, the next generation of Vim.
    ttf-hack-nerd # A typeface designed for source code.
    nnn # A tiny, lightning fast, feature-packed file manager.
    # perimeter81 # A secure network access solution for the modern and distributed workforce.
    pwgen # A utility that generates random, meaningless but pronounceable passwords.
    python-pip # A package installer for Python.
    ripgrep # A line-oriented search tool that recursively searches your current directory for a regex pattern.
    rustup # A version management tool for installing the Rust programming language.
    sccache # A ccache-like caching compiler wrapper, aiming to speed up compile times.
    # seahorse # GNOME's application for managing encryption keys and passwords in the GNOME Keyring.
    # slack-desktop # A collaboration platform that unifies your team's communications.
    # steam # A digital platform by Valve Corporation, serves as a distribution platform for digital games, multiplayer gaming, video streaming and social networking services.
    stow # A symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place.
    tig # A text-mode interface for git.
    tilt-bin # A multi-service development environment controller.
    tmux # A terminal multiplexer for Unix-like operating systems.
    xclip # A command line interface to the X11 clipboard.
    zoxide # A faster way to navigate your filesystem.
    zsh # A shell designed for interactive use, although it is also a powerful scripting language.

    # Others
    # kio-gdrive # A KDE gdrive integration
    xbindkeys # A program that allows you to launch shell commands with your keyboard or mouse under the X Window System.
    xvkbd # A virtual (graphical) keyboard program for X Window System which provides facility to enter characters onto other clients software by clicking a keyboard displayed on the screen.
    wezterm # A GPU-accelerated cross-platform terminal emulator and multiplexer, most notable for its ligature and emoji support.
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
    # flux2
    github-cli
    # helm
    java
    just
    # k9s
    # kubectl
    # kubectx
    maven
    nodejs
    packer
    # sops
    terraform
    terraform-docs
    terraform-ls
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
      pip install "$PACKAGE" --break-system-packages
    fi
  done

  # gem packages
  # declare -a GEM_PACKAGES_INSTALLED
  # declare -a GEM_PACKAGES_TO_INSTALL
  # GEM_PACKAGES_INSTALLED=($(gem list))

  # GEM_PACKAGES_TO_INSTALL=(
  #   neovim
  # )

  # for PACKAGE in "${GEM_PACKAGES_TO_INSTALL[@]}"; do
  #   if ! echo "${GEM_PACKAGES_INSTALLED[@]}" | grep -q "$PACKAGE" &>/dev/null; then
  #     gem install "$PACKAGE"
  #   fi
  # done

  # npm packages
  declare -a NPM_PACKAGES_INSTALLED
  declare -a NPM_PACKAGES_TO_INSTALL
  NPM_PACKAGES_INSTALLED=($(npm list))
  NPM_PACKAGES_TO_INSTALL=(
    neovim
    opencommit
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
# stow -t "$HOME" hyprland/
stow -t "$HOME" neovim
# stow -t "$HOME" scripts
stow -t "$HOME" starship
# stow -t "$HOME" systemd/
stow -t "$HOME" tig/
stow -t "$HOME" tmux
stow -t "$HOME" wezterm/
stow -t "$HOME" wireplumber/
stow -t "$HOME" zsh/
