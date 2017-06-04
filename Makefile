all: completion-manager-dependencies

completion-manager-dependencies:
	pip3 install --user neovim jedi psutil setproctitle 
