
install:
	make backup
	ln -sf ~/Projects/nvim ~/.config/nvim

backup:
	mv ~/.config/nvim{,.bak}
	mv ~/.local/share/nvim{,.bak}
	mv ~/.local/state/nvim{,.bak}
	mv ~/.cache/nvim{,.bak}

restore:
	make erase
	mv ~/.config/nvim.bak ~/.config/nvim
	mv ~/.local/share/nvim.bak ~/.local/share/nvim
	mv ~/.local/state/nvim.bak ~/.local/state/nvim
	mv ~/.cache/nvim.bak ~/.cache/nvim

erase:
	rm -r ~/.config/nvim
	rm -r ~/.local/share/nvim
	rm -r ~/.local/state/nvim
	rm -r ~/.cache/nvim
