# Haskell in Vagrant

A simple template to start using GHC/Cabal in Vagrant

## Getting started with Yesod

1. `yesod init --bare`
2. `cabal sandbox init`
3. `cabal install -j --enable-tests --max-backjumps=-1 --reorder-goals`
4. `yesod devel`
