#!/bin/bash

# Alfredo.blog Local Development Server (Hugo)
# Usage: ./start.sh

BLOG_PATH="/Users/alfredo/Developer/github.com/gutierrezfredo/alfredo.blog-local"
cd "$BLOG_PATH"

# Check for new micro.blog export in Downloads
LATEST_EXPORT=$(ls -td ~/Downloads/gutifredo_* 2>/dev/null | head -1)
LAST_IMPORT="$BLOG_PATH/.last_import"

if [ -n "$LATEST_EXPORT" ] && [ -d "$LATEST_EXPORT/content" ]; then
    if [ ! -f "$LAST_IMPORT" ] || [ "$LATEST_EXPORT" -nt "$LAST_IMPORT" ]; then
        echo "New micro.blog export found: $LATEST_EXPORT"
        echo "Importing content..."
        cp -R "$LATEST_EXPORT/content/"* "$BLOG_PATH/content/"
        # Fix URLs
        find "$BLOG_PATH/content" -name "*.md" -exec sed -i '' 's|https://alfredo.blog/|/|g' {} \;
        find "$BLOG_PATH/content" -name "*.md" -exec sed -i '' 's|src="uploads/|src="/uploads/|g' {} \;

        touch "$LAST_IMPORT"
        echo "Content imported and URLs fixed!"
        echo ""
    fi
fi

echo "Pulling latest images from archive..."
cd /Users/alfredo/Developer/github.com/gutierrezfredo/alfredo.blog-archive && git pull
cd "$BLOG_PATH"

echo ""
echo "Starting Hugo dev server with live reload..."
echo ""
echo "Site:     http://localhost:1313/"
echo "Theme:    alfredo.blog-theme"
echo "CSS:      themes/gutifredo/static/styles.css"
echo ""
echo "Changes auto-reload in browser!"
echo "Press Ctrl+C to stop"
echo ""

open http://localhost:1313/
hugo server --disableFastRender
