#!/usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_DIR=$( dirname -- "${SCRIPT_DIR}")
UPSTREAM_DIR="$REPO_DIR/upstream"

if [[ $# -lt 1 ]]; then
	echo "Missing arguments"
	exit
fi

new_tag=$1
echo "new tag: $new_tag"

new_version="${new_tag#v}"
echo "new version: $new_version"

cd $UPSTREAM_DIR
git fetch
git checkout "$new_tag"

new_commit="$(git rev-parse HEAD)"
echo "new commit: $new_commit"

cd $REPO_DIR

echo "update sources"
"$SCRIPT_DIR/create-sources.sh"

echo "update version number"
sed -i "s/-p:Version=[^ ]*/-p:Version=${new_version}/g" "$REPO_DIR/com.nexusmods.app.yaml"

echo "update manifest"
sed -i "s/tag: \".*\"/tag: \"${new_tag}\"/g" "$REPO_DIR/com.nexusmods.app.yaml"
sed -i "s/commit: \".*\"/commit: \"${new_commit}\"/g" "$REPO_DIR/com.nexusmods.app.yaml"
