export VISUAL=vim
export EDITOR="$VISUAL"

export RSHELL=$(dirname $(readlink -f $0))

source $RSHELL/general-zsh.zsh
source $RSHELL/alias-and-functions.zsh

# Zinit
source_if_exists ~/.zinit/bin/zinit.zsh
if typeset -f zinit > /dev/null; then
  # regular plugins loaded without tracking.
  zinit light zsh-users/zsh-autosuggestions
  zinit light zdharma/fast-syntax-highlighting

  # Plugin history-search-multi-word loaded with tracking.
  zinit load zdharma/history-search-multi-word

  # Load the pure theme, with zsh-async library that's bundled with it.
  zinit ice pick"async.zsh" src"pure.zsh"
  zinit light sindresorhus/pure

  # prezto's git module
  # zplugin ice svn
  # zplugin snippet PZT::modules/git

  # oh-my-zsh
  zinit snippet OMZ::plugins/git/git.plugin.zsh
fi
