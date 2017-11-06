#!/bin/bash

# Install nvm
curl -o- 'https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh' | bash
nvm install '9.0.0'

# install global npm packages
npm install -g 'npm'
npm install -g 'generator-odin-scss'
npm install -g 'generator-pixel2html-shopify'
npm install -g 'yo'
