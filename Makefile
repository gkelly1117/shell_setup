upload:
	-cp ~/.emacs src/
	-cp ~/.bashrc src/
	-cp ~/.gitconfig src/
	-cp ~/.inputrc src/
	-cp ~/.profile src/
	-cp ~/.bashrc.d/commands.sh src/.bashrc.d/
	-cp ~/.emacs.d/pabbrev.el src/.emacs.d/
	-cp ~/.emacs.d/js2.elc src/.emacs.d/

install:
	make backup
	cp -r src/* ~/

backup:
	mkdir -p ~/.shell_setup_backup
	-cp ~/.emacs ~/.shell_setup_backup/
	-cp ~/.bashrc ~/.shell_setup_backup/
	-cp ~/.gitconfig ~/.shell_setup_backup/
	-cp ~/.inputrc ~/.shell_setup_backup/
	-cp ~/.profile ~/.shell_setup_backup/
	-cp -r ~/.emacs.d/ ~/.shell_setup_backup/
	-cp -r ~/.bashrc.d/ ~/.shell_setup_backup/
