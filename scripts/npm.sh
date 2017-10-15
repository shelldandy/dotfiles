#!/bin/bash

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash

nvm install '8.5.0'


# install global npm packages
npm i -g npm
npm i -g yarn
npm i -g npm-check-updates
npm i -g now
npm i -g tern
npm i -g trash-cli
