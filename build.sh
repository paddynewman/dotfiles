#!/bin/sh

files='.bash_profile .bashrc .vimrc .tmux.conf .gitconfig'

for file in $files; do
	(set -x; cp $file ~/$file)
done
