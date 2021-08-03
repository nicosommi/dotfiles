printf "${BLUE}Installing nico's dotfiles...${NORMAL}\n"
# cp ~/dotfiles/zsh/templates/zshrc.zsh-template ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Git hooks templates (ctags)
git config --global init.templatedir '~/.git_template'
mkdir -p ~/.git_template
# cp -R git_templates/* ~/.git_template
ln -sf ~/dotfiles/git_templates ~/.git_template
# Enables git ctags command
git config --global alias.ctags '!.git/hooks/ctags'

# cp .gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig


printf "${BLUE}Configuring fish${NORMAL}\n"

mkdir -p ~/.config

# cp -R ~/dotfiles/fish ~/.config
ln -sf ~/dotfiles/fish ~/.config/fish

printf "${BLUE}Finished.${NORMAL}\n"
