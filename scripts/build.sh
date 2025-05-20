#!/usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_DIR=$( dirname -- "${SCRIPT_DIR}")

flatpak-builder "$REPO_DIR/build-dir" --user --force-clean --install --repo=repo "$REPO_DIR/com.nexusmods.app.yaml"
