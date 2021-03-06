FILES = .zshrc \
	.bashrc \
	.bash_profile \
	.vimrc \
	.tmux.conf \
	.gitignore \
	.gitconfig \
	.curlrc \
	.ssh/rc

DIRECTORIES = .vim

update: files directories

files:
	for file in $(FILES); do \
	    mkdir -p $$(dirname $$file); \
	    cp -r ~/$$file $$file; \
	done

directories:
	for directory in $(DIRECTORIES); do \
	    mkdir -p $$(dirname $$directory); \
	    cp -r ~/$$directory .; \
	done
