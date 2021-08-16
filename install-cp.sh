printf "${BLUE}Installing nico's dotfiles...${NORMAL}\n"
cp ~/dotfiles/zsh/.zshrc ~/.zshrc
cp ~/dotfiles/vim/.vimrc ~/.vimrc
cp ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Git hooks templates (ctags)
git config --global init.templatedir '~/.git_template'
mkdir -p ~/.git_template
cp -R git_templates/* ~/.git_template
cp ~/dotfiles/git_templates/.gitconfig ~/.gitconfig
# Enables git ctags command
git config --global alias.ctags '!.git/hooks/ctags'

cp ~/dotfiles/.gitconfig ~/.gitconfig


printf "${BLUE}Configuring fish${NORMAL}\n"

mkdir -p ~/.config

cp -R ~/dotfiles/fish/. ~/.config/fish

printf "${BLUE}Finished.${NORMAL}\n"
