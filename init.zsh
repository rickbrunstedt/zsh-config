export VISUAL=vim
export EDITOR="$VISUAL"

mac_readlinkf() {
  perl -MCwd -e 'print Cwd::abs_path shift' "$1";
}

if [[ "$OSTYPE" == darwin* ]]; then
  export RSHELL=$(dirname $(mac_readlinkf $0))
else
  export RSHELL=$(dirname $(readlink -f $0))
  # export RSHELL=$(dirname "$(readlink -f $0)")
fi

source $RSHELL/general-zsh.zsh
source $RSHELL/alias-and-functions.zsh

# Zinit
source_if_exists ~/.zinit/bin/zinit.zsh
if typeset -f zinit > /dev/null; then
 zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light chrissicool/zsh-256color
  zinit light hbd/history-search-multi-word

  # Load the pure theme, with zsh-async library that's bundled with it.
  zinit ice pick"async.zsh" src"pure.zsh"
  zinit light sindresorhus/pure

  # oh-my-zsh
  # https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh
  zinit snippet OMZ::lib/git.zsh
  # https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
  zinit snippet OMZ::plugins/git/git.plugin.zsh

  # https://github.com/sorin-ionescu/prezto/tree/master/modules/utility
  # zinit snippet PZT::modules/utility/init.zsh
fi
