upload:
	cp ~/.emacs .
	cp ~/.bashrc .
	cp ~/.gitconfig .
	cp ~/.inputrc .
	cp ~/.profile .
	cp -r ~/.emacs.d .

install:
	make backup
	cp .emacs ~/
	cp .bashrc ~/
	cp .gitconfig ~/
	cp .inputrc ~/
	cp .profile ~/
	cp -r .emacs.d ~/

backup:
	mkdir -p ~/.shell_setup_backup
	cp .emacs ~/.shell_setup_backup/
	cp .bashrc ~/.shell_setup_backup/
	cp .gitconfig ~/.shell_setup_backup/
	cp .inputrc ~/.shell_setup_backup/
	cp .profile ~/.shell_setup_backup/
	cp -r .emacs.d ~/.shell_setup_backup/