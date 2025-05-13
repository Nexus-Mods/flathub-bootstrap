# NexusMods.App

```bash
# setup
git submodule --init --recursive
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak-builder build-dir --user --install-deps-from=flathub --download-only com.nexusmods.app.yaml

# create nuget-sources.json
python3 flatpak-builder-tools/dotnet/flatpak-dotnet-generator.py --dotnet 9 --runtime linux-x64 --freedesktop 24.08 nuget-sources.json upstream/src/NexusMods.App/NexusMods.App.csproj

# build flatpak
flatpak-builder build-dir --user --install-deps-from=flathub --download-only com.nexusmods.app.yaml
flatpak-builder build-dir --user --force-clean --install --repo=repo com.nexusmods.app.yaml
```

