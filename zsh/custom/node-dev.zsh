install-nvm() {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | zsh
}

nvm-set-default-latest() {
  nvm alias default node
}
