set -gx DOTFILES ~/dotfiles

# You must call it on initialization or listening to directory switching won't work
echo "Enable auto nvm setup calling load_nvm function"

# pnpm
set -gx PNPM_HOME "/Users/nicosommi/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end