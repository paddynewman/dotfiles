all:
	cp ~/.zshrc .zshrc
	cp ~/.bashrc .bashrc
	cp ~/.bash_profile .bash_profile
	cp ~/.vimrc .vimrc
	cp ~/.tmux.conf .tmux.conf
	cp ~/.gitignore .gitignore
	cp ~/.gitconfig .gitconfig
	cp ~/.curlrc .curlrc
	mkdir -p .vim && cp -r ~/.vim .
	mkdir -p .ssh && cp ~/.ssh/rc .ssh
	rm .vim/.netrwhist
