function vscode_newprofile
  mkdir -p ~/vscode-profiles/$argv[1]/{data,extensions}
  vscode_initialize $argv
end

# initializes the vscode profile without telemetry, etc
function vscode_initialize
  cp -r $DOTFILES/templates/vscode/_profile/. ~/vscode-profiles/$argv[1]
end

function vscode_deleteprofile
  rm -fr ~/vscode-profiles/$argv[1]
end

function vscode_launchprofile
  code --user-data-dir ~/vscode-profiles/$argv[1]/data --extensions-dir ~/vscode-profiles/$argv[1]/extensions $argv[2..]
end

alias code-nodejs="vscode_launchprofile nodejs"
alias code-golang="vscode_launchprofile golang"
alias code-terraform="vscode_launchprofile terraform"
alias code-writing="vscode_launchprofile writing"
