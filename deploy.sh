#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:M4thez/allegro-summer-experience-2022.git main:gh-pages

# navigate into the previous working directory
cd -