
typeset -U path

path+=$(go env GOPATH)/bin
path+=$(python3 -m site --user-base)/bin
path+=~/.local/bin
