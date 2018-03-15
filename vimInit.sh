# A Simple startup script for initializing this Vim config
ln -s ~/.vim/init.vim ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c 'PlugInstall | qa' #Install all Plugins!
