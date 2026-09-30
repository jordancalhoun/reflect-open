#!/usr/bin/env bash

set -euo pipefail

if ! command -v omarchy >/dev/null 2>&1; then
  echo "This setup script must be run on Omarchy." >&2
  exit 1
fi

# Tauri's Arch Linux prerequisites, plus pnpm and patchelf for this workspace
# and its Linux bundles. Omarchy skips packages that are already installed.
omarchy pkg add \
  appmenu-gtk-module \
  base-devel \
  curl \
  file \
  libayatana-appindicator \
  librsvg \
  nodejs \
  openssl \
  patchelf \
  pnpm \
  webkit2gtk-4.1 \
  wget \
  xdotool

if ! command -v cargo >/dev/null 2>&1 || ! command -v rustc >/dev/null 2>&1; then
  omarchy pkg add rustup
  rustup default stable
fi

echo
echo "Omarchy build prerequisites are ready."
echo "Run 'pnpm install --frozen-lockfile', then 'pnpm tauri build'."
