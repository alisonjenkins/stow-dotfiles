# vim: set foldmethod=marker:
# {{{ Bash helper functions
if [ ! -e "$HOME/.local/share" ]; then
  mkdir -p "$HOME/.local/share"
fi

# {{{ Installations
# {{{ Asdf installation
ASDF_DIR="$HOME/.local/share/asdf"
if [ ! -e "$ASDF_DIR" ]; then
  git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch v0.7.8
fi
# }}}
# {{{ base16 installation
BASE16_SHELL="$HOME/.config/base16-shell/"
if [ ! -e "${BASE16_SHELL}" ]; then
  git clone https://github.com/chriskempson/base16-shell.git "${BASE16_SHELL}"
fi
# }}}
# {{{ Bash preexec
BASH_PREEXEC="$HOME/.local/share/bash-preexec"
if [ ! -e "${BASH_PREEXEC}" ]; then
  git clone https://github.com/rcaloras/bash-preexec.git "${BASH_PREEXEC}"
fi
# }}}
# }}}
# {{{ Source existing files bash helpers
SOURCE_FILES=(
  $HOME/git/bashton-my-aws/functions
  $HOME/git/bashton-sshuttle/sshuttle-vpn
  $HOME/git/puppet-log-reader/bash-functions.sh
  /usr/share/bash-completion/bash_completion
  /usr/share/doc/pkgfile/command-not-found.bash
  /usr/share/git/completion/git-completion.bash
  /usr/local/git/contrib/completion/git-completion.bash
  /usr/share/git/completion/git-prompt.sh
  /usr/local/etc/bash_completion.d/git-prompt.sh
  /usr/lib/ruby/gems/2.5.0/gems/tmuxinator-0.12.0/completion/tmuxinator.bash
  "$HOME/.local/share/asdf/completions/asdf.bash"
  "$HOME/.local/share/asdf/asdf.sh"
  "${BASH_PREEXEC}/bash-preexec.sh"
)

for FILE in "${SOURCE_FILES[@]}"; do
  if [ -e "$FILE" ]; then
    source "$FILE"
  fi
done
# }}}
# {{{ nnn cd
n() {
  # Block nesting of nnn in subshells
  if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
  # To cd on quit only on ^G, remove the "export" as in:
  #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  # NOTE: NNN_TMPFILE is fixed, should not be modified
  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

  # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
  # stty start undef
  # stty stop undef
  # stty lwrap undef
  # stty lnext undef

  nnn "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}
# }}}
# {{{ Bash Preexec functions
function __tf_warning() {
  # are we running terraform?
  if grep -qE "^terraform\ ?.*|make\ ?.*" <<< "$1"; then
    # do we have a session token?
    if env | grep -q ^AWS_SESSION_TOKEN; then
      # is it valid for less than 25 minutes?
      if [ "$(awsexpires)" -lt 25 ]; then
        _profile="$(env | grep ^AWS_DEFAULT_PROFILE | awk -F= '{print $2}')"
        echo "[TERRAFORM] refreshing session token for ${_profile}"
        awseval "${_profile}"
      fi
    fi
  fi
}
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
export preexec_functions+=(__tf_warning)
# }}}
eval "$(direnv hook bash)"
# }}}
