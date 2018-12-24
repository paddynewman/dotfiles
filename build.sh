#!/bin/sh

for file in .zshrc .tmux.conf .gitconfig; do
	(set -x; cp $file ~/$file)
done
