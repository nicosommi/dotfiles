printf "${BLUE}Installing nico's dotfiles...${NORMAL}\n"
# cp ~/dotfiles/zsh/templates/zshrc.zsh-template ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Git hooks templates (ctags)
git config --global init.templatedir '~/.git_template'
mkdir -p ~/.git_template/{hooks,info}
# cp -R git_templates/* ~/.git_template
ln -sf ~/dotfiles/git_templates/hooks/* ~/.git_template/hooks/.
ln -sf ~/dotfiles/git_templates/info/* ~/.git_template/info/.
# Enables git ctags command
git config --global alias.ctags '!.git/hooks/ctags'

# cp .gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig


printf "${BLUE}Configuring fish${NORMAL}\n"

mkdir -p ~/.config/fish/{completions,conf.d,functions}

# cp -R ~/dotfiles/fish ~/.config
ln -sf ~/dotfiles/fish/completions/*.fish ~/.config/fish/completions
ln -sf ~/dotfiles/fish/conf.d/*.fish ~/.config/fish/conf.d
ln -sf ~/dotfiles/fish/functions/*.fish ~/.config/fish/functions
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/fish/fish_plugins ~/.config/fish/fish_plugins

printf "${BLUE}Finished.${NORMAL}\n"
