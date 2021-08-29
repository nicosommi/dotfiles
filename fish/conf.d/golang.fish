function load_goroot
  set -gx GOPATH ~/go
  set -gx GOROOT (go env GOROOT)
  
  fish_add_path $GOPATH/bin
  fish_add_path $GOROOT/bin
end

set -gx GOROOT ~/homebrew/Cellar/go/1.17

fish_add_path ~/homebrew/Cellar/go/1.17/bin

load_goroot
