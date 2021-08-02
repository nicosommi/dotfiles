function nvm
  if status is-interactive
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
  end
end
