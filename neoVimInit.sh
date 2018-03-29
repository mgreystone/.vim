# A Simple startup script for initializing this NeoVim config
mkdir -p ~/.config/nvim/
ln -s ~/.vim/init.vim ~/.config/nvim/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c 'PlugInstall | qa' #Install all Plugins!
