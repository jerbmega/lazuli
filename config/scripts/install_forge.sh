#!/usr/bin/env bash
set -oue pipefail

mkdir forge
cd forge

LOCATION=$(curl -s https://api.github.com/repos/forge-ext/forge/releases/latest \
| grep "zipball_url" \
| awk '{ print $2 }' \
| sed 's/,$//'       \
| sed 's/"//g' )     \
; curl -L -o forge.zip $LOCATION
unzip forge.zip
cd $(ls -d */|head -n 1)

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
