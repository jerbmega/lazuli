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

mkdir -p temp
cp metadata.json temp
cp -r resources temp
cp -r schemas temp
cp -r config temp
cp -r lib temp
cp *.js temp
cp *.css temp
cp LICENSE temp
mkdir -p temp/locale

mkdir -p "/usr/share/gnome-shell/extensions/forge@jmmaranan.com"
cp -r temp/* "/usr/share/gnome-shell/extensions/forge@jmmaranan.com"

cd ../..
yes | rm -rf forge
