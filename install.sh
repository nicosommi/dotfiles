printf "${BLUE}Installing nicosommi dotfiles...${NORMAL}\n"
printf "${BLUE}Using nicosommi Oh My Zsh template file and adding it to ~/.zshrc, along with other dotfiles${NORMAL}\n"
cp ~/dotfiles/zsh/templates/zshrc.zsh-template ~/.zshrc
cp ~/dotfiles/vim/.vimrc ~/.vimrc
cp ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Git hooks templates (ctags)
git config --global init.templatedir '~/.git_template'
mkdir -p ~/.git_template
cp -R git_templates/* ~/.git_template
# Enables git ctags command
git config --global alias.ctags '!.git/hooks/ctags'

cp .gitconfig ~/.gitconfig


printf "${BLUE}Configuring fish${NORMAL}\n"

mkdir -p ~/.config/fish/conf.d

cp -R ~/dotfiles/fish ~/.config

printf "${BLUE}Finished.${NORMAL}\n"
