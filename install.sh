printf "${BLUE}Installing nicosommi dotfiles...${NORMAL}\n"
printf "${BLUE}Using nicosommi Oh My Zsh template file and adding it to ~/.zshrc${NORMAL}\n"
cp ~/dotfiles/zsh/templates/zshrc.zsh-template ~/.zshrc
mv -f ~/.zshrc-omztemp ~/.zshrc
