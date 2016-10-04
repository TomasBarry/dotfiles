#!/bin/bash

stack new myfirstproject servant && cd myfirstproject

DIR="$( cd "$( dirname "$BASH_SOURCE[0]}" )" && pwd )"

echo '' >> $DIR/stack.yml
echo 'docker:' >> $DIR/stack.yaml
echo '   enable: true' >> $DIR/stack.yaml

sudo stack docker pull
sudo stack build yesod-bin cabal-install --install-ghc
