#!/bin/bash -xe

export VERSION=1.206
TMPDIR=$(mktemp -d)
pushd $TMPDIR
curl -L -o firacode.zip https://github.com/tonsky/FiraCode/releases/download/${VERSION}/FiraCode_${VERSION}``.zip
unzip firacode.zip
mkdir -p ~/Library/Fonts
cp -R ttf/ ~/Library/Fonts/
popd
rm -rf $TMPDIR
