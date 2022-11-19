# inspired on
# <https://mrsauravsahu.medium.com/custom-vscode-profiles-migrating-settings-and-extensions-14a5f8f4da35>

function vscode_pf_help
  echo "Use nodejs, golang, rust, terraform, writing, pkb, full, shell as the argument of any of these vscode_pf_* prefixed commands.\n"
  echo "Features\n"
  echo "- Create a profile with vscode_pf_new\n"
  echo "- Initialize a profile with vscode_pf_init\n"
  echo "- Delete a profile with vscode_pf_delete\n"
  echo "- Backup extensions with vscode_pf_backup_extensions\n"
  echo "- Restore extensions with vscode_pf_restore_extensions\n"
  echo "- Launch a profile with vscode_pf_launch vscodium_pf_launch\n"
  echo "- Aliases to common profiles\n"
end

function vscode_pf_new
  mkdir -p ~/vscode-profiles/$argv[1]/{data,extensions}
  vscode_pf_init $argv
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

function launch_lines
  for ext in (cat $argv[1])
    if string length ext > 0
      vscode_pf_launch $argv[2..] --install-extension $ext
    end
  end
end

function vscode_pf_restore_extensions
  launch_lines $DOTFILES/templates/vscode/base_extensions.txt $argv
  
  launch_lines $DOTFILES/templates/vscode/extensions_$argv[1].txt $argv
end

alias code-full="vscode_pf_launch full"
alias code-shell="vscode_pf_launch shell"
alias code-nodejs="vscode_pf_launch nodejs"
alias code-python="vscode_pf_launch python"
alias code-golang="vscode_pf_launch golang"
alias code-rust="vscode_pf_launch rust"
alias code-terraform="vscode_pf_launch terraform"
alias code-writing="vscodium_pf_launch writing"
alias code-pkb="vscodium_pf_launch pkb"
alias code-writing="vscode_pf_launch writing"
alias code-pascal="vscode_pf_launch pascal"

alias code-dotfiles="vscode_pf_launch shell ~/dotfiles"
