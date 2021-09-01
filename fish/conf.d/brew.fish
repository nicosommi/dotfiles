function load_brew_packages
  pushd ~/dotfiles
    brew bundle install
  popd
end

set -gx HOMEBREW_CELLAR ~/homebrew/Cellar
set -gx HOMEBREW_PREFIX ~/homebrew
