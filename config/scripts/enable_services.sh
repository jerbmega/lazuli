#!/usr/bin/env bash
set -oue pipefail

systemctl enable tailscaled.service
