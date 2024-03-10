# For installation read the README.md file

# Zsh config
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# export EDITOR="nvim"

alias reload="source ~/.zprofile"

# ls
if [[ "$OSTYPE" == darwin* ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
alias ll='ls -lh'
alias la='ll -A'

# open Everywhere
if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
else
  alias open='xdg-open'
  alias o='xdg-open'
fi

# Git alias and functions
function git_current_branch() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo $branch
  fi
}

function gsf() {
  sh -c "git diff --relative --name-only HEAD~${1:-1}"
}

alias gst="git status"
alias gpf="git push --force-with-lease"
alias gpsup="git push --set-upstream origin $(git_current_branch)"
alias gidiot="git commit --amend --no-edit"
alias cb="git_current_branch | tr -d '\n' | pbcopy"
alias gcauth="git commit --amend --reset-author"

# NPM - updated packages to latest versions
alias npm-update-versions="npx npm-check-updates -u"
