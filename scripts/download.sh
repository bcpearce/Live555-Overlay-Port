#!/bin/bash
LIVE555_DOWNLOAD_URL=$(cat CMakePresets.json | jq -r '.configurePresets.[] | select(.name == "vcpkg")'.cacheVariables.LIVE555_DOWNLOAD_URL)
DEST="live555.tar.gz"
curl -s --show-error -o $DEST $LIVE555_DOWNLOAD_URL 
if [[ $1 = "unpack" ]]; then
    tar -xvzf $DEST
elif [[ $1 = "sha" ]]; then
    echo "$(sha512sum $DEST | awk '{print $1}')"
fi