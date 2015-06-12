#!/usr/bin/env bash

# Haskell Toolbelt: https://www.stackage.org/install
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install-1.20 ghc-7.8.4

# Link Cabal and GHC
cat >> ~/.bashrc <<EOF
export PATH=~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:$PATH
EOF
export PATH=~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:$PATH

# Additional required libraries
sudo apt-get install zlib1g-dev
sudo apt-get install postgresql
sudo apt-get install libpq-dev

# Required Cabal binaries
cabal update
cabal install alex happy yesod-bin

# Set up Postgres
mkfifo sql
cat <<'EOF' > sql
CREATE USER vagrant WITH PASSWORD 'vagrant';
CREATE DATABASE vagrant;
GRANT ALL PRIVILEGES ON DATABASE vagrant TO vagrant;
\q
EOF
sudo -u postgres psql -f sql
