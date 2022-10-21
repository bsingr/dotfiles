#!/bin/bash -xe

export VERSION=1.206
TMPDIR=$(mktemp -d)
pushd $TMPDIR
curl -L -o firacode.zip https://github.com/tonsky/FiraCode/releases/download/${VERSION}/FiraCode_${VERSION}``.zip
unzip firacode.zip
open ttf/FiraCode-Regular.ttf
popd
rm -rf $TMPDIR
