# Install vundle
VUNDLE_FILE=~/.vim/bundle/Vundle.vim
if test -f "$VUNDLE_FILE"; then
  echo "$VUNDLE_FILE exist already"
else
  echo "Install Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Link vim file
VIM_SETTINGS_FILE=~/.config/nvim/init.vim
if test -f "$VIM_SETTINGS_FILE"; then
  echo "$VIM_SETTINGS_FILE exist already"
else
  echo "symlinking vim file"
  mkdir -p "${VIM_SETTINGS_FILE%/*}"
  ln -sn $RSHELL/vim $VIM_SETTINGS_FILE
fi

