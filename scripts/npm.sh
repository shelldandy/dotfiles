#!/bin/bash

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

nvm install '8.8.1'


# install global npm packages
npm i -g npm
npm i -g npm-check-updates
npm i -g now
npm i -g tern
npm i -g trash-cli
