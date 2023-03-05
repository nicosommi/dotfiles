function load_brew_packages
  pushd ~/dotfiles
    brew bundle install
  popd
end

alias bbrew "HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=1 brew"

set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_PREFIX /opt/homebrew

fish_add_path /opt/homebrew/bin