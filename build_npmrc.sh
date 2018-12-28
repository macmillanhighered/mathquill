#!/bin/bash

if [[ -z $NPM_USER ]]; then
  echo 'NPM_USER is not set'
  exit 1
elif [[ -z $NPM_PASSWORD ]]; then
  echo 'NPM_PASSWORD is not set'
  exit 2
fi

curl -u $NPM_USER:$NPM_PASSWORD https://registry.sh.mml.cloud/artifactory/api/npm/auth > .npmrc
curl -u $NPM_USER:$NPM_PASSWORD https://registry.sh.mml.cloud/artifactory/api/npm/npm-local/auth/macmillan-learning >> .npmrc
echo registry=https://registry.npmjs.org >> .npmrc
cat .npmrc
