function install-package-manager
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

alias install-fisher="install-package-manager"
