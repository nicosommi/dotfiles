function install_omf
  curl -L https://get.oh-my.fish > install_omf_pkg

  fish install_omf_pkg --path=~/omf --config=~/.config/omf

  rm install_omf_pkg
end
