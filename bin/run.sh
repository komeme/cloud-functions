#!/usr/bin/env bash

set -o errexit

run_command() {
    echo $dir
    echo $RUN_SCRIPT
    pushd $dir && (. ./bin/${RUN_SCRIPT}.sh); RESULT=$? && popd
    if [[ $RESULT !=  0 ]]; then
       exit $RESULT
    fi
}

BUILD_DIRS=$(circleci tests split ./bin/tmp/build-target.txt)
export RUN_SCRIPT=${1:-build}
echo $BUILD_DIRS
echo ""

for dir in $BUILD_DIRS
do
    echo $dir
    echo $RUN_SCRIPT
    run_command $dir $RUN_SCRIPT
done
