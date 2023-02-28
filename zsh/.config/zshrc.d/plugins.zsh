mkdir -p ~/.local/share/zinit
test -d ~/.local/share/zinit/bin || git clone https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit/bin

# Configure zinit
declare -A ZINIT
ZINIT[BIN_DIR]=~/.local/share/zinit/bin
ZINIT[HOME_DIR]=~/.local/share/zinit

source ~/.local/share/zinit/bin/zinit.zsh

export _ZL_MATCH_MODE=1

zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit load Aloxaf/fzf-tab
zinit load alanjjenkins/kube-aliases
zinit load fabiokiatkowski/exercism.plugin.zsh
zinit load joepvd/zsh-hints
zinit load macunha1/zsh-terraform
zinit load molovo/tipz
zinit load zsh-users/zsh-completions

# Install rtx version manager (replacement for asdf)
zinit ice from"gh-r" as"command" mv"rtx* -> rtx" \
  atclone'./rtx complete -s zsh > _rtx' atpull'%atclone'
zinit light jdxcode/rtx
eval "$(rtx activate zsh)"

# install zoxide
zinit ice wait lucid from"gh-r" as"command" \
  atclone'./zoxide init zsh > init.zsh' \
  atpull'%atclone' src"init.zsh"
zinit light ajeetdsouza/zoxide

# Setup direnv
eval "$(rtx exec direnv -- direnv hook zsh)"

# A shortcut for asdf managed direnv.
direnv() { rtx exec direnv -- direnv "$@"; }

zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/aws/aws.plugin.zsh'
zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/command-not-found/command-not-found.plugin.zsh'

# For postponing loading `fzf`
zinit ice lucid wait
zinit snippet OMZP::fzf

# Fix Mcfly downloading the wrong binary
case $(uname) in
  Darwin)
    case $(uname -m) in
      x86_64)
        mcfly_os="*x86_64*darwin*"
      ;;
      arm64)
        mcfly_os="*aarch64*darwin*"
      ;;
    esac
  ;;
  Linux)
    case $(uname -m) in
      x86_64)
        mcfly_os="*x86_64*linux*musl*"
      ;;
      arm64)
        mcfly_os="*aarch64*linux*"
      ;;
    esac
  ;;
esac

zinit ice lucid wait"0a" from"gh-r" as"program" atload'eval "$(mcfly init zsh)"' bpick"${mcfly_os}"
zinit light cantino/mcfly

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
