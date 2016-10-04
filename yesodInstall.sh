#1/bin/bash


# Install the Yesod command line tools
setterm -term linux -fore 'blue'

echo '###############################################################'
echo '######### Installing the Yesod command line tools #############'
echo ''

stack build yesod-bin cabal-install --install-ghc

echo ''
echo '####### Installed the Yesod command line tools ################'
echo '###############################################################'

setterm -term linux -fore 'white'
