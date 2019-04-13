#!/bin/sh

set -eux

git stash
git checkout master
git pull origin master

VER=$(curl --head -s -L http://www.stackage.org/lts | grep location | awk -F' /' '{print $2}' | sed 's/\r//')

ls template/Dockerfile
sed "s/{{RESOLVER_VERSION}}/${VER}/" template/Dockerfile > Dockerfile

DIFF=$(git diff --name-only)

if [ "${DIFF}" = "Dockerfile" ]; then
  git checkout -b ${VER}
  git add Dockerfile
  git commit -m "update Dockerfile ${VER}"
  git push origin ${VER}
fi
