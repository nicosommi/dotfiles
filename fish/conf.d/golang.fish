function set_goroot
  set -gx GOROOT /usr/local/go
  set -gx GOPATH ~/go
end

set_goroot
