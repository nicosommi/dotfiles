function nvm-install
  curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | fish
end

function nvm-set-default-latest
  nvm alias default node
end

function pnpm-install
  curl -fsSL https://get.pnpm.io/install.sh | sh -
end

