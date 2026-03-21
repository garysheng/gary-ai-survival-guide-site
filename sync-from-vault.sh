#!/bin/bash
# Build-time sync: clone the vault repo and copy publishable content.
# Runs on Vercel before `npx quartz build`.
#
# Requires VAULT_GITHUB_TOKEN env var (GitHub PAT with repo read access).
# For local dev, run the old sync-content.sh instead (reads from sibling dir).

set -euo pipefail

REPO="https://${VAULT_GITHUB_TOKEN}@github.com/garysheng/gary-ai-survival-guide.git"
CLONE_DIR="/tmp/vault-clone"
DEST="content/"

echo "==> Cloning vault repo (shallow)..."
rm -rf "$CLONE_DIR"
git clone --depth 1 "$REPO" "$CLONE_DIR"

echo "==> Syncing content..."
rm -rf "$DEST"
mkdir -p "$DEST"

rsync -av --delete \
  --exclude='_*' \
  --exclude='.obsidian' \
  --exclude='.git' \
  --exclude='CLAUDE.md' \
  --exclude='README.md' \
  --exclude='skills/' \
  "$CLONE_DIR/" "$DEST"

rm -rf "$CLONE_DIR"

echo "==> Content synced successfully."
