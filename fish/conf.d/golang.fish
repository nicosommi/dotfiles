function load_goroot
  set -gx GOPATH ~/go
  set -gx GOROOT (go env GOROOT)

  fish_add_path $GOPATH/bin
  fish_add_path $GOROOT/bin
end

load_goroot