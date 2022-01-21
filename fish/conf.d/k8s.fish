fish_add_path ~/.krew/bin

function install_krew
  set -x; set temp_dir (mktemp -d); cd "$temp_dir" &&
  set OS (uname | tr '[:upper:]' '[:lower:]') &&
  set ARCH (uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/') &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
  tar zxvf krew.tar.gz &&
  set KREWNAME krew-$OS"_"$ARCH &&
  ./$KREWNAME install krew &&
  set -e KREWNAME; set -e temp_dir
end

function install_kubectl_context_prompt
  set --universal tide_right_prompt_items kubectl $tide_right_prompt_items
end

function remove_kubectl_context_prompt
  echo "For now just set the variable manually without it, like the example below"
  echo "set --universal tide_right_prompt_items status cmd_duration context jobs node virtual_env go terraform"
  # 
  # set --universal tide_right_prompt_items (string replace -r 'kubectl ' '' $tide_right_prompt_items)
end


