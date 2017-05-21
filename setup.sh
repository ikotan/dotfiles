#! /bin/sh

DOT_FILES=( .vimrc .vimrc.bundle .vimrc.plugins_setting .perltidyrc .tmux.conf .env.function .gitconfig )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'
