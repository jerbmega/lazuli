#!/usr/bin/env bash
set -oue pipefail

mkdir forge
cd forge

curl -L -o forge.zip https://github.com/forge-ext/forge/archive/refs/tags/v44-75.zip
unzip forge.zip
cd forge-44-75

mkdir -pv temp
cp -v metadata.json temp
cp -rv resources temp
cp -rv schemas temp
cp -rv config temp
cp -rv lib temp
cp -v *.js temp
cp -v *.css temp
cp -v LICENSE temp
mkdir -pv temp/locale

mkdir -pv "/usr/share/gnome-shell/extensions/forge@jmmaranan.com"
cp -rv temp/* "/usr/share/gnome-shell/extensions/forge@jmmaranan.com"

cd ../..
rm -rfv forge
