#!/bin/sh

files='.bash_profile .bashrc .vimrc .tmux.conf .gitconfig .gitignore .curlrc'

for file in $files; do
	(set -x; cp $file ~/$file)
done
