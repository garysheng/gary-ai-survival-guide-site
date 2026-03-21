# Gary's AI Survival Guide — Site

Quartz 4 site that publishes the AI Survival Guide vault as a static website.

**Live site:** https://aisurvivalguide.garysheng.com

## Architecture

Content lives in a separate private repo ([gary-ai-survival-guide](https://github.com/garysheng/gary-ai-survival-guide)). This repo contains only the Quartz config, theme, and build pipeline. Content is cloned at build time, not stored here.

```
vault repo (private)              site repo (public)
gary-ai-survival-guide    →    gary-ai-survival-guide-site
  (source of truth)               (Quartz + config only)
        │                                │
        │  push to main                  │
        ▼                                ▼
  GitHub Action fires          Vercel deploy hook triggers
        │                                │
        └──────────────┐                 │
                       ▼                 ▼
                  Vercel builds site:
                  1. sync-from-vault.sh clones vault
                  2. npx quartz build
                  3. Deploy static files
```

## How It Works

1. **Vault repo** is the single source of truth for all content
2. On push to main, a GitHub Action in the vault repo hits a Vercel Deploy Hook
3. Vercel runs `sync-from-vault.sh`, which clones the vault and strips internal dirs
4. Quartz builds the static site from the cloned content
5. Zero manual sync. Zero truth drift.

## Environment Variables (Vercel)

| Variable | Purpose |
|----------|---------|
| `VAULT_GITHUB_TOKEN` | Fine-grained GitHub PAT with read access to the vault repo |

## Secrets (Vault Repo GitHub Actions)

| Secret | Purpose |
|--------|---------|
| `VERCEL_DEPLOY_HOOK` | Vercel Deploy Hook URL that triggers a rebuild of this site |

## Local Dev

For local development, use the original `sync-content.sh` which reads from a sibling directory:

```bash
# Assumes gary-ai-survival-guide is cloned as a sibling
bash sync-content.sh
npx quartz build --serve
```

## Theme

Colors match the Applied AI Society brand: cream (#FAF7F1), olive (#5B6E4D), orange (#E67B35), dark (#1A1A1A).
