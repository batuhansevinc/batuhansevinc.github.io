#!/bin/bash
# Simple deployment script

# Build the site
npm run build

# Create a temporary deployment branch
git checkout --orphan gh-pages-temp
git rm -rf .

# Copy dist contents to root
cp -r dist/* .
rm -rf dist

# Commit
git add -A
git commit -m "Deploy: $(date)"

# Force push to gh-pages
git push -f origin gh-pages-temp:gh-pages

# Return to feature branch
git checkout claude/redesign-personal-website-015wJW9Uxiy7PycX28mMTTfV
git branch -D gh-pages-temp

echo "Deployed! Set GitHub Pages to use gh-pages branch in Settings."
