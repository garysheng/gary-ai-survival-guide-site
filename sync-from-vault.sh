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

echo "==> Cloning vault repo..."
rm -rf "$CLONE_DIR"
git clone "$REPO" "$CLONE_DIR"

# Remove internal/excluded content from clone
rm -rf "$CLONE_DIR"/_raw "$CLONE_DIR"/_staging "$CLONE_DIR"/_state "$CLONE_DIR"/_templates
rm -rf "$CLONE_DIR"/.obsidian "$CLONE_DIR"/.git "$CLONE_DIR"/.github
rm -rf "$CLONE_DIR"/skills
rm -f "$CLONE_DIR"/CLAUDE.md "$CLONE_DIR"/README.md

# Replace content directory with cleaned clone
rm -rf "$DEST"
mv "$CLONE_DIR" "$DEST"

# Verify
echo "==> content/ root files:"
ls "$DEST"/
echo "==> Checking index.md exists:"
if [ -f "$DEST/index.md" ]; then
  echo "  YES: content/index.md found"
  head -5 "$DEST/index.md"
else
  echo "  MISSING: content/index.md not found!"
  echo "  content/ contains:"
  find "$DEST" -name "index.md" | head -10
fi
echo "==> Done."
