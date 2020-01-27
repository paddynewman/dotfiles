#!/bin/sh

files='.zshrc .vimrc .tmux.conf .gitconfig .gitignore .curlrc'

for file in $files; do
	(set -x; cp $file ~/$file)
done
