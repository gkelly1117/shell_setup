upload:
	cp ~/.emacs src/
	cp ~/.bashrc src/
	cp ~/.gitconfig src/
	cp ~/.inputrc src/
	cp ~/.profile src/
	cp -r ~/.emacs.d src/

install:
	make backup
	cp src/.emacs ~/
	cp src/.bashrc ~/
	cp src/.gitconfig ~/
	cp src/.inputrc ~/
	cp src/.profile ~/
	cp -r src/.emacs.d ~/

backup:
	mkdir -p ~/.shell_setup_backup
	cp src/.emacs ~/.shell_setup_backup/
	cp src/.bashrc ~/.shell_setup_backup/
	cp src/.gitconfig ~/.shell_setup_backup/
	cp src/.inputrc ~/.shell_setup_backup/
	cp src/.profile ~/.shell_setup_backup/
	cp -r src/.emacs.d ~/.shell_setup_backup/