upload:
	cp ~/.emacs src/
	cp ~/.bashrc src/
	cp ~/.gitconfig src/
	cp ~/.inputrc src/
	cp ~/.profile src/
	cp -r ~/.emacs.d/ src/.emacs.d/

install:
	make backup
	cp src/.emacs ~/
	cp src/.bashrc ~/
	cp src/.gitconfig ~/
	cp src/.inputrc ~/
	cp src/.profile ~/
	mkdir -p ~/.emacs.d
	cp -r src/.emacs.d ~/.emacs.d/

backup:
	mkdir -p ~/.shell_setup_backup
	cp ~/.emacs ~/.shell_setup_backup/
	cp ~/.bashrc ~/.shell_setup_backup/
	cp ~/.gitconfig ~/.shell_setup_backup/
	cp ~/.inputrc ~/.shell_setup_backup/
	cp ~/.profile ~/.shell_setup_backup/
	mkdir -p ~/.shell_setup_backup/.emacs.d
	cp -r ~/.emacs.d/ ~/.shell_setup_backup/.emacs.d/
