#!/bin/sh

files='.zshrc .vimrc .tmux.conf .gitconfig .gitignore .curlrc'

if [ "X$1" = "X-u" ]; then
    for file in $files; do
        (set -x; cp ~/$file $file)
    done
    (set -x; cp -r ~/.vim .)
else
    for file in $files; do
        (set -x; cp $file ~/$file)
    done
    (set -x; cp -r .vim ~)
fi
