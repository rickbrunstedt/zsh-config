# General alias
alias reload="source ~/.zshrc"
alias ...="../../"
alias ....="../../../"
alias .....="../../../../"
alias ......="../../../../../"


# ls
if [[ "$OSTYPE" == darwin* ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
alias ll='ls -lh'
alias la='ll -A'

# visual studio code
alias cn="code --new-window"

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

# pbcopy Everywhere
if [[ "$OSTYPE" == linux-gnu ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

get_absolute_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

source_if_exists () {
    [[ -f "$1" ]] && source "$1"
}

# Git alias and functions
alias gidiot="git commit --amend --no-edit"
alias cb="current_branch | tr -d '\n' | pbcopy"
alias gcauth="git commit --amend --reset-author"
gsf() {
  sh -c "git diff --relative --name-only HEAD~${1:-1}"
}
