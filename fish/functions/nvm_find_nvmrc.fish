function nvm_find_nvmrc
  if status is-interactive
    bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
  end
end
