#!/bin/bash


stack new myfirstproject yesod-sqlite && cd myfirstproject

# DIR="$( cd "$( dirname "$BASH_SOURCE[0]}" )" && pwd )"

echo '' >> stack.yaml
echo 'docker:' >> stack.yaml
echo '   enable: true' >> stack.yaml

stack docker pull
stack build yesod-bin cabal-install --install-ghc
