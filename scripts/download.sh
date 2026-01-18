#!/bin/bash
set -e
LIVE555_DOWNLOAD_URL=$(cat ./ports/live555/live555-download-url)
DEST="live555.tar.gz"
curl -s --show-error -o $DEST $LIVE555_DOWNLOAD_URL
if [[ $1 = "unpack" ]]; then
    tar -xvzf $DEST
elif [[ $1 = "sha" ]]; then
    echo "$(sha512sum $DEST | awk '{print $1}')"
fi