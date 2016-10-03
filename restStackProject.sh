#!/bin/bash

stack new my-project servant && cd my-project

DIR="$( cd "$( dirname "$BASH_SOURCE[0]}" )" && pwd )"

echo 'docker:' >> $DIR/stack.yaml
echo '   enable: true' >> $DIR/stack.yaml

sudo stack docker pull
sudo stack build yesod-bin cabal-install --install-ghc
