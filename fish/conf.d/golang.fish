function set_goroot
  set -gx GOROOT /usr/local/go
  set -gx GOPATH /usr/local/go/bin
end

set_goroot
