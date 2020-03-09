#!/usr/bin/env bash

set -o errexit

SCRIPT=${1:-build}
CURRENT_BRANCH=`git rev-parse --abbrev-ref @`

TARGET="origin/develop"

echo "Current Branch: " ${CURRENT_BRANCH}
echo "Diff Target: " ${TARGET}

BASE_DIR=$(dirname $0)
mkdir -p ${BASE_DIR}/tmp
touch ${BASE_DIR}/tmp/build-target.txt

# Check if commit_hash or tag has specific format
echo $COMMIT_MESSAGE

# Build only changed projects
for dir in */ ; do
  echo ${dir}
  if [[ -d "$dir" && ! -L "$dir" && "$dir" != "bin/" ]]; then
    if [[ -f "$dir/.skip-build" ]]; then
        echo "- $dir"
    else
      if [[ -n $(git diff ${TARGET} --name-status | grep "$dir")  ]]; then
        echo "○ $dir"
        echo ${dir} >> ${BASE_DIR}/tmp/build-target.txt
      else
        echo "- $dir"
      fi
    fi
  fi;
done
