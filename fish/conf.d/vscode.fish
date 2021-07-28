# inspired on
# <https://mrsauravsahu.medium.com/custom-vscode-profiles-migrating-settings-and-extensions-14a5f8f4da35>

function vscode_pf_help
  echo "Use nodejs, golang, rust, terraform, writing, pkb, full, shell as the argument of any of these vscode_pf_* prefixed commands.\n"
  echo "Features\n"
  echo "- Create / Delete a profile\n"
  echo "- Backup / Restore extensions\n"
  echo "- Launch a profile\n"
  echo "- Aliases to common profiles\n"
end

function vscode_pf_new
  mkdir -p ~/vscode-profiles/$argv[1]/{data,extensions}
  vscode_initialize $argv
end

# initializes the vscode profile without telemetry, etc
function vscode_pf_init
  cp -r $DOTFILES/templates/vscode/_profile/. ~/vscode-profiles/$argv[1]
end

function vscode_pf_delete
  rm -fr ~/vscode-profiles/$argv[1]
end

function vscode_pf_launch
  code --user-data-dir ~/vscode-profiles/$argv[1]/data --extensions-dir ~/vscode-profiles/$argv[1]/extensions $argv[2..]
end

function vscodium_pf_launch
  codium --user-data-dir ~/vscode-profiles/$argv[1]/data --extensions-dir ~/vscode-profiles/$argv[1]/extensions $argv[2..]
end

function vscode_pf_backup_extensions
  vscode_pf_launch $argv --list-extensions | tee $DOTFILES/templates/vscode/extensions_$argv[1].txt
end

function vscode_pf_restore_extensions
  for ext in (cat $DOTFILES/templates/vscode/base_extensions.txt)
    vscode_pf_launch $argv --install-extension $ext
  end

  for ext in (cat $DOTFILES/templates/vscode/extensions_$argv[1].txt)
    vscode_pf_launch $argv --install-extension $ext
  end
end

alias code-full="vscode_pf_launch full"
alias code-shell="vscode_pf_launch shell"
alias code-nodejs="vscode_pf_launch nodejs"
alias code-golang="vscode_pf_launch golang"
alias code-rust="vscode_pf_launch rust"
alias code-terraform="vscode_pf_launch terraform"
alias code-writing="vscodium_pf_launch writing"
alias code-pkb="vscodium_pf_launch pkb"

alias code-dotfiles="vscode_pf_launch shell ~/dotfiles"
