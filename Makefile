FILES = .zshrc \
	.bashrc \
	.bash_profile \
	.vimrc \
	.tmux.conf \
	.gitconfig \
	.gitignore \
	.ssh/rc

DIRECTORIES = .vim

update: files directories

files:
	for file in $(FILES); do \
	    mkdir -pv $$(dirname $$file); \
	    cp -rv ~/$$file $$file; \
	done

directories:
	for directory in $(DIRECTORIES); do \
	    mkdir -pv $$(dirname $$directory); \
	    cp -rv ~/$$directory .; \
	done
