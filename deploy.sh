#!/bin/bash
set -euo pipefail
repo="/opt/dockefiles/hugo_ericolerudcom"
branch="master"
lockfile="/tmp/hugo-ericolerudcom-deploy.lock"
logtag="hugo-ericolerudcom-deploy"

exec 9>"$lockfile"
flock -n 9 || exit 0

cd "$repo"

git fetch --prune origin "$branch"

if git diff --quiet HEAD "origin/$branch"; then
    logger -t "$logtag" "No source changes; skipping deploy."
    exit 0
fi

git reset --hard "origin/$branch"

docker compose build --pull
docker comp

logger -t "$logtag" "Deployed $(git rev-parse --short HEAD)."
