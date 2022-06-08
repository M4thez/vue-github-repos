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

# default branch name is 'main' yet for some reason there needs to be 'master'
git push -f git@github.com:M4thez/vue-github-repos.git master:gh-pages

# navigate into the previous working directory
cd -