#!/usr/bin/env bash

urls=(
    "https://example.com/"
    "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/github/vsextensions/copilot-chat/0.33.2025110604/vspackage"
)

IS_DOCKER=${IS_DOCKER:-0}

for url in "${urls[@]}"; do
    echo "[CURL] Verifying URL: $url"
    status_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")
    echo "[CURL] Status code: $status_code"
    node fetch.mjs "$url"
done

if [ $IS_DOCKER -eq 0 ]; then
    echo "=== [DOCKER] Running in Docker environment ==="
    docker run --rm -v "$(pwd)":/app -w /app -e IS_DOCKER=1 node:latest ./verify_setup.sh
fi


