#!/bin/bash
# Sync content from the AI Survival Guide Obsidian vault
# Excludes internal dirs (_raw, _staging, _state, _templates), .obsidian, CLAUDE.md, skills/

SOURCE="../hyperagency/"
DEST="content/"

rsync -av --delete \
  --exclude='_*' \
  --exclude='.obsidian' \
  --exclude='.git' \
  --exclude='CLAUDE.md' \
  --exclude='README.md' \
  --exclude='skills/' \
  "$SOURCE" "$DEST"

echo "Content synced from $SOURCE to $DEST"
