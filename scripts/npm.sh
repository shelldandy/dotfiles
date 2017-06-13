#!/bin/bash

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

nvm install 6.11.0


# install global npm packages
npm i -g npm
npm i -g yarn
