#!/bin/bash
# This function should be called from the root of the parent git repository, as in:
# # the previous command was:
# git submodule add https://github.com/danny316p/travis-web-check.git
# # So the command to call this script should then be:
# ./travis-web-check/deploy_as_submodule.sh

ln -s ./travis-web-check/.travis.yml .travis.yml
ln -s ./travis-web-check/find_problems.sh find_problems.sh
git add .travis.yml
git add find_problems.sh
git commit find_problems.sh .travis.yml -m "Add Travis Web Check submodule"


