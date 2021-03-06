workspace=~/workspace
ide=code
ide_ws_extension=code-workspace
text_editor=code
brave=/Applications/Brave.app/Contents/MacOS/Brave\ Browser

alias ws="cd $workspace"

remember-passphrase-per-session() {
  copy-to-clipboard "AddKeysToAgent yes"
  echo "Add this at the first line in ~/.ssh/config with a text editor (copied to clipboard): AddKeysToAgent yes"
  read -s -k '?Press any key to open it with the text editor or CTRL+C to abort.'
  $text_editor ~/.ssh/config
}

brave-app() {
  $brave --app=$1
}

code-pwa() {
  local port=""
  pushd $1
  local wd=${$(pwd)//\//\_}
  local name="code-$wd"
  docker run -d $2 -p $port:3000 -v "$(pwd):/home/project:cached" --name $name theiaide/theia:next
  local finalPort=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "3000/tcp") 0).HostPort}}' $name)
  brave-app http://localhost:$finalPort
  popd
}

code-pwa-rm() {
  code-pwa $1 --rm
}

telegram() {
  brave-app https://web.telegram.org/
}

code-sandbox() {
  brave-app https://codesandbox.io/
}

perf-site-help() {
  echo "perf-site https://nicosommi.com"
}
perf-site-cls() {
  lighthouse $1 --quiet --chrome-flags="--headless" --output json | jq '.audits[\"$2\"].displayValue'
}

perf-site() {
  lighthouse $1 --quiet --chrome-flags="--headless" --output json | lighthouse-console-reporter
}

fix_mosh_server() {
  local fw='/usr/libexec/ApplicationFirewall/socketfilterfw'
  local mosh_sym="$(which mosh-server)"
  local mosh_abs="$(readlink -f $mosh_sym)"

  sudo "$fw" --setglobalstate off
  sudo "$fw" --add "$mosh_sym"
  sudo "$fw" --unblockapp "$mosh_sym"
  sudo "$fw" --add "$mosh_abs"
  sudo "$fw" --unblockapp "$mosh_abs"
  sudo "$fw" --setglobalstate on
}

