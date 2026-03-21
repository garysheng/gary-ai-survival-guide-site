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

# Copy everything, then remove excluded dirs/files
cp -r "$CLONE_DIR"/* "$DEST" 2>/dev/null || true
cp -r "$CLONE_DIR"/.[!.]* "$DEST" 2>/dev/null || true

# Remove internal/excluded content
rm -rf "$DEST"/_raw "$DEST"/_staging "$DEST"/_state "$DEST"/_templates
rm -rf "$DEST"/.obsidian "$DEST"/.git "$DEST"/.github
rm -rf "$DEST"/skills
rm -f "$DEST"/CLAUDE.md "$DEST"/README.md

rm -rf "$CLONE_DIR"

echo "==> Content synced successfully."
