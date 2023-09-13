#!/usr/bin/env bash
set -oue pipefail

systemctl enable dconf-update.service
systemctl enable tailscaled.service
