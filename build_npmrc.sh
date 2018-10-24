#!/bin/bash

curl -u $NPM_USER:$NPM_PASSWORD https://registry.sh.mml.cloud/artifactory/api/npm/auth > .npmrc
curl -u $NPM_USER:$NPM_PASSWORD https://registry.sh.mml.cloud/artifactory/api/npm/npm-local/auth/macmillan-learning >> .npmrc
echo 'registry=https://registry.sh.mml.cloud/artifactory/api/npm/npm/' >> .npmrc
cat .npmrc
