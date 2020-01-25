
function install_vundle() {
  VUNDLE_FILE=~/.vim/bundle/Vundle.vim
  if test -f "$VUNDLE_FILE"; then
    echo "$VUNDLE_FILE exist already"
  else
    echo "Install Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi
}

function link_vim_file() {
  VIM_SETTINGS_FILE=~/.config/nvim/init.vim
  if test -f "$VIM_SETTINGS_FILE"; then
    echo "$VIM_SETTINGS_FILE exist already"
  else
    echo "symlinking vim file"
    mkdir -p "${VIM_SETTINGS_FILE%/*}"
    ln -sn $RSHELL/vim $VIM_SETTINGS_FILE
  fi
}

function install_zinit() {
  # create folder
  mkdir ~/.zinit

  # clone project
  ZINIT_REPO_PATH=~/.zinit/bin/zinit.zsh
  if test -f "$ZINIT_REPO_PATH"; then
    echo "Zinit is installed already"
  else
    echo "Cloning Zinit repo"
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
  fi
}

function add_rshell_to_zsh() {
  text="source \${HOME}/.custom-zsh/init.zsh"
  echo $text >> ${HOME}/.zshrc
}

function setup_all() {
  install_vundle
  link_vim_file
  install_zinit
}