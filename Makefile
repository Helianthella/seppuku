default: install

install:
	-mkdir -p ~/.oh-my-zsh/custom/themes
	-cp -f src/seppuku.zsh-theme ~/.oh-my-zsh/custom/themes/seppuku.zsh-theme
	-sed -i -r "s/ZSH_THEME=\"[^\"]*\"/ZSH_THEME=\"seppuku\"/" ~/.zshrc

uninstall:
	-rm -f ~/.oh-my-zsh/custom/themes/seppuku.zsh-theme
	-sed -i "s/ZSH_THEME=\"seppuku\"/ZSH_THEME=\"\"/" ~/.zshrc
