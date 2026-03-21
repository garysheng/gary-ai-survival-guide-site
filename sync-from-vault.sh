#!/bin/bash
# Build-time sync: clone the vault repo and copy publishable content.
# Runs on Vercel before `npx quartz build`.
#
# Requires VAULT_GITHUB_TOKEN env var (GitHub PAT with repo read access).
# For local dev, run the old sync-content.sh instead (reads from sibling dir).

set -euo pipefail

REPO="https://${VAULT_GITHUB_TOKEN}@github.com/garysheng/gary-ai-survival-guide.git"
CLONE_DIR="/tmp/vault-clone"
DEST="content"

echo "==> Cloning vault repo (shallow)..."
rm -rf "$CLONE_DIR"
git clone --depth 1 "$REPO" "$CLONE_DIR"

echo "==> Preparing content directory..."
rm -rf "$DEST"

# Remove internal/excluded content from clone before moving into place
rm -rf "$CLONE_DIR"/_raw "$CLONE_DIR"/_staging "$CLONE_DIR"/_state "$CLONE_DIR"/_templates
rm -rf "$CLONE_DIR"/.obsidian "$CLONE_DIR"/.git "$CLONE_DIR"/.github
rm -rf "$CLONE_DIR"/skills
rm -f "$CLONE_DIR"/CLAUDE.md "$CLONE_DIR"/README.md

# Move the cleaned clone directly into content/
mv "$CLONE_DIR" "$DEST"

echo "==> Content directory contents:"
ls -la "$DEST"/
echo "==> Chapter count:"
ls -d "$DEST"/[0-9]* | wc -l

echo "==> Content synced successfully."
