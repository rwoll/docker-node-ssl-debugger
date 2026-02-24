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
    docker build --quiet -t verify-setup .

    echo "=== [DOCKER] Running WITH NODE_EXTRA_CA_CERTS ==="
    docker run --pull=never --rm -v "$(pwd)":/app -w /app -e IS_DOCKER=1 verify-setup ./verify_setup.sh

    echo "=== [DOCKER] Running WITHOUT NODE_EXTRA_CA_CERTS ==="
    docker run --pull=never --rm -v "$(pwd)":/app -w /app -e IS_DOCKER=1 -e NODE_EXTRA_CA_CERTS= verify-setup ./verify_setup.sh
fi


