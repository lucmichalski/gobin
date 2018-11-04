#!/usr/bin/env bash

# **START**

echo "machine github.com login $GITHUB_USERNAME password $GITHUB_PAT" >> $HOME/.netrc
echo "" >> $HOME/.netrc
echo "machine api.github.com login $GITHUB_USERNAME password $GITHUB_PAT" >> $HOME/.netrc
git config --global user.email "$GITHUB_USERNAME@example.com"
git config --global user.name "$GITHUB_USERNAME"
git config --global advice.detachedHead false
git config --global push.default current

# block: get
GO111MODULE=off go get -u github.com/myitcv/gobin

# block: fix path
export PATH=$(go env GOPATH)/bin:$PATH
which gobin

# behind the scenes fix the version of gohack we install
gobin github.com/rogpeppe/gohack@v0.0.1

# block: gohack
gobin github.com/rogpeppe/gohack

# block: gohack latest
gobin github.com/rogpeppe/gohack@latest

# block: gohack v1.0.0-alpha.2
gobin github.com/rogpeppe/gohack@v1.0.0-alpha.2

# block: gohack print
gobin -p github.com/rogpeppe/gohack@v1.0.0-alpha.2

# block: gohack run
gobin -r github.com/rogpeppe/gohack@v1.0.0-alpha.2 -help
assert "$? -eq 2" $LINENO

