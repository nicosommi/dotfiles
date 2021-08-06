function load_brew_packages
  pushd ~/dotfiles
    brew bundle install
  popd
end
