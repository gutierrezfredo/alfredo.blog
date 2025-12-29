# Microblog Local Development

## Quick Start

**alfredo.blog:**
```bash
./start.sh
```
→ http://localhost:1313/

**alfredo.design:**
```bash
/Users/alfredo/Developer/github.com/gutierrezfredo/microblog-design-local/start.sh
```
→ http://localhost:1314/

Or just ask Claude: "start the dev server for alfredo.blog"

## Workflow

1. Start local server (script or ask Claude)
2. Edit CSS/templates in theme folder
3. Changes auto-reload in browser
4. When ready → ask Claude to push to GitHub
5. Reload theme in Micro.blog

## CSS Files

- gutifredo: `../microblog-gutifredo-theme/static/styles.css`
- design: `../microblog-design-theme/static/styles.css`

## Refresh Content

When Micro.blog pushes new posts to archive:
```bash
./refresh.sh
```

## Notes

- Disable CDN in Micro.blog while actively styling
- CSS version: update `$cssVersion` in theme's `layouts/partials/head.html` when pushing
