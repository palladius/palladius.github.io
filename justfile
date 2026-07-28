# palladius.github.io — Justfile

# List all commands
default:
    just -l

# Run Hugo dev server on port 1313
serve:
    hugo server -p 1313 --disableFastRender

# Build the site
build:
    hugo

# Run all tests
test: test-broken-images test-build

# Test: find broken local image references
test-broken-images:
    @bash scripts/test-broken-images.sh

# Test: Hugo builds without errors
test-build:
    @echo "🏗️  Testing Hugo build..."
    @hugo 2>&1 | grep -i error && echo "❌ BUILD FAILED" && exit 1 || echo "✅ Hugo build OK"

# Deploy: commit and push
deploy msg="update":
    git add -A && git commit -m '{{msg}}' && git push origin main

# Show site stats
stats:
    @echo "📊 Site Statistics"
    @echo "  📝 Articles: $(find content/posts -maxdepth 1 -type d | wc -l | tr -d ' ')"
    @echo "  🖼️  Images:   $(find static/images -type f 2>/dev/null | wc -l | tr -d ' ')"
    @echo "  📦 Static:   $(du -sh static/ | cut -f1)"
