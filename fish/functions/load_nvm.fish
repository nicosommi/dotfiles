function load_nvm_auto --on-variable="PWD"
  set -l npm_config_prefix ""
  set -l default_node_version (nvm version default)
  set -l node_version (nvm version)
  set -l nvmrc_path (nvm_find_nvmrc)
  if test -n "$nvmrc_path"
    set -l nvmrc_node_version (nvm version (cat $nvmrc_path))
    if test "$nvmrc_node_version" = "N/A"
      nvm install (cat $nvmrc_path)
    else if test nvmrc_node_version != node_version
      nvm use $nvmrc_node_version
    end
  else if test "$node_version" != "$default_node_version"
    echo "Reverting to default Node version"
    nvm use default
  end
end

function load_nvm
  nvm use 12
  load_npm_bins
end

function load_npm_bins
  fish_add_path (npm config --global get prefix)/bin
end
