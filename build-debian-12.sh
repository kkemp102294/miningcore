#!/bin/bash

# install install-dependencies
sudo apt-get update; \
  sudo apt-get -y install wget

# add dotnet repo
sudo wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb -y

# install dev-dependencies
sudo apt-get update; \
sudo apt-get install -y dotnet-sdk-8.0 git cmake build-essential libssl-dev pkg-config libboost-all-dev libsodium-dev libzmq3-dev

(cd src/Miningcore && \
BUILDIR=${1:-../../build} && \
echo "Building into $BUILDIR" && \
dotnet publish -c Release --framework net8.0 -o $BUILDIR)
