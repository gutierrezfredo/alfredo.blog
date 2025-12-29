#!/bin/bash

# Alfredo.blog Local Development Server (Hugo)
# Usage: ./start.sh

cd /Users/alfredo/Developer/github.com/gutierrezfredo/microblog-gutifredo-local

echo "Starting Hugo dev server with live reload..."
echo ""
echo "Site:     http://localhost:1313/"
echo "Theme:    microblog-gutifredo-theme"
echo "CSS:      themes/gutifredo/static/styles.css"
echo ""
echo "Changes auto-reload in browser!"
echo "Press Ctrl+C to stop"
echo ""

open http://localhost:1313/
hugo server --disableFastRender
