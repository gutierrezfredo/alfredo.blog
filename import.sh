#!/bin/bash

# Import micro.blog export and fix absolute URLs
# Usage: ./import.sh ~/Downloads/gutifredo_XXXXXX

if [ -z "$1" ]; then
    echo "Usage: ./import.sh <path-to-microblog-export>"
    echo "Example: ./import.sh ~/Downloads/gutifredo_d26098"
    exit 1
fi

EXPORT_PATH="$1"
BLOG_PATH="/Users/alfredo/Developer/github.com/gutierrezfredo/alfredo.blog-local"

if [ ! -d "$EXPORT_PATH/content" ]; then
    echo "Error: $EXPORT_PATH/content not found"
    exit 1
fi

echo "Importing content from $EXPORT_PATH..."

# Copy content
cp -R "$EXPORT_PATH/content/"* "$BLOG_PATH/content/"

# Fix absolute URLs to relative
echo "Fixing absolute URLs..."
find "$BLOG_PATH/content" -name "*.md" -exec sed -i '' 's|https://alfredo.blog/|/|g' {} \;

echo "Done! Content imported and URLs fixed."
echo "Hugo should auto-reload if running."
