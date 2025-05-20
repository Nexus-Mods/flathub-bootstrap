#!/usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_DIR=$( dirname -- "${SCRIPT_DIR}")

flatpak-builder build-dir --user --install-deps-from=flathub --download-only "$REPO_DIR/com.nexusmods.app.yaml"
