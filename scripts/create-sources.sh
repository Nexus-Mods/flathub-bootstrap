#!/usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_DIR=$( dirname -- "${SCRIPT_DIR}")
UPSTREAM_DIR="$REPO_DIR/upstream"

python3 flatpak-builder-tools/dotnet/flatpak-dotnet-generator.py --dotnet 9 --runtime linux-x64 --freedesktop 24.08 "$REPO_DIR/nuget-sources.json" "$UPSTREAM_DIR/src/NexusMods.App/NexusMods.App.csproj"
