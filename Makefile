FILES = .zshrc \
	.bashrc \
	.bash_profile \
	.vimrc \
	.tmux.conf \
	.gitignore \
	.gitconfig \
	.curlrc

DIRECTORIES = .vim

all:
	$(foreach file, $(FILES),cp ~/$(file) $(file);)
	$(foreach directory, $(DIRECTORIES),cp -r ~/$(directory) .;)

	rm .vim/.netrwhist
