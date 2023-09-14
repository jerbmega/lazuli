#!/usr/bin/env bash
set -oue pipefail

# People that need these tools can just invoke them through CLI, they don't need to appear in GNOME.
rm -f /usr/share/applications/htop.desktop
rm -f /usr/share/applications/nvtop.desktop

# We recommend use of Extension Manger instead and Yafti installs this: we don't need this to be here.
rm -f /usr/share/applications/org.gnome.Extensions.desktop 
