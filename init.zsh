export VISUAL=vim
export EDITOR="$VISUAL"

# General alias
alias reload="source ~/.zshrc"
alias ll='ls -lh'
alias la='ll -A'

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

# Git alias and functions
alias gst="git status"
alias gidiot="git commit --amend --no-edit"
alias cb="current_branch | tr -d '\n' | pbcopy"
alias gcauth="git commit --amend --reset-author"
gsf() {
  sh -c "git diff --relative --name-only HEAD~${1:-1}"
}


if typeset -f zplugin > /dev/null; then
  # regular plugins loaded without tracking.
  zplugin light zsh-users/zsh-autosuggestions
  zplugin light zdharma/fast-syntax-highlighting

  # Plugin history-search-multi-word loaded with tracking.
  zplugin load zdharma/history-search-multi-word

  # Load the pure theme, with zsh-async library that's bundled with it.
  zplugin ice pick"async.zsh" src"pure.zsh"
  zplugin light sindresorhus/pure
fi
