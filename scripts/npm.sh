#!/bin/bash

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

nvm install --lts


# install global npm packages
npm i -g np
npm i -g yarn
