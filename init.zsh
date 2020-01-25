export VISUAL=vim
export EDITOR="$VISUAL"

export RSHELL=$(dirname $(readlink -f $0))


# General alias
alias reload="source ~/.zshrc"
alias ll='ls -lh'
alias la='ll -A'

# Resource Usage
alias df='df -kh'
alias du='du -kh'

# open Everywhere
if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
else
  alias open='xdg-open'
  alias o='xdg-open'
fi

get_absolute_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

source_if_exists () {
    [[ -f "$1" ]] && source "$1"
}

source_if_exists ~/.zinit/bin/zinit.zsh

# Git alias and functions
# alias gst="git status"
alias gidiot="git commit --amend --no-edit"
alias cb="current_branch | tr -d '\n' | pbcopy"
alias gcauth="git commit --amend --reset-author"
gsf() {
  sh -c "git diff --relative --name-only HEAD~${1:-1}"
}


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

