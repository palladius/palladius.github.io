#!/usr/bin/env bash
# Test: find all broken local image references in Hugo content
# Shows broken image paths and how many articles reference them

CONTENT_DIR="content/posts"
STATIC_DIR="static"

echo "🔍 Scanning for broken local image references..."
echo ""

# Collect all local image refs
ALL_REFS=$(grep -rohiE 'src="[^"]+\.(jpg|jpeg|png|gif|svg|webp)"' "$CONTENT_DIR" 2>/dev/null | \
    sed 's/src="//gi; s/"//g' | \
    grep -viE '^(https?://|file://|data:)' | \
    sed 's|^/||; s|\.\./||g')

# Part 1: Detail — broken images with which article
echo "═══════════════════════════════════════════════════"
echo "📋 BROKEN IMAGES (detail)"
echo "═══════════════════════════════════════════════════"

BROKEN_DETAIL=0
for f in $(grep -rliE 'src="[^"]+"' "$CONTENT_DIR" 2>/dev/null); do
    SLUG=$(echo "$f" | sed 's|content/posts/||; s|/index\.html||; s|/index\.md||')
    grep -ohiE 'src="[^"]+\.(jpg|jpeg|png|gif|svg|webp)"' "$f" 2>/dev/null | \
        sed 's/src="//gi; s/"//g' | \
        grep -viE '^(https?://|file://|data:)' | \
        while read -r img; do
        # Normalize: strip leading / and leading ../
        CLEAN=$(echo "$img" | sed 's|^/||; s|\.\./||g')
        
        # URL-decode %20 etc
        DECODED=$(printf '%b' "${CLEAN//%/\\x}")
        
        # Check if file exists in static/
        if [ ! -f "$STATIC_DIR/$DECODED" ]; then
            echo "  ❌ /$img"
            echo "     └─ in: $SLUG"
            echo "BROKEN" >> /tmp/palladius_broken_count.tmp
        fi
    done
done

echo ""
echo "═══════════════════════════════════════════════════"
echo "📊 BROKEN IMAGE SUMMARY (aggregated)"  
echo "═══════════════════════════════════════════════════"

# Part 2: Summary — unique broken images with reference count
echo "$ALL_REFS" | sort | uniq -c | sort -rn | while read -r count img; do
    [ -z "$img" ] && continue
    DECODED=$(printf '%b' "${img//%/\\x}")
    if [ ! -f "$STATIC_DIR/$DECODED" ]; then
        printf "  ❌ %-55s (%d refs)\n" "/$img" "$count"
    fi
done

echo ""

# Count totals
TOTAL_UNIQUE=$(echo "$ALL_REFS" | sort -u | grep -c . || true)
BROKEN_UNIQUE=0
OK_UNIQUE=0
for img in $(echo "$ALL_REFS" | sort -u); do
    [ -z "$img" ] && continue
    DECODED=$(printf '%b' "${img//%/\\x}")
    if [ -f "$STATIC_DIR/$DECODED" ]; then
        OK_UNIQUE=$((OK_UNIQUE + 1))
    else
        BROKEN_UNIQUE=$((BROKEN_UNIQUE + 1))
    fi
done

echo "═══════════════════════════════════════════════════"
echo "  ✅ Found:  $OK_UNIQUE unique images"
echo "  ❌ Broken: $BROKEN_UNIQUE unique images"
echo "  📊 Total:  $TOTAL_UNIQUE unique local image refs"
echo "═══════════════════════════════════════════════════"

# Cleanup
rm -f /tmp/palladius_broken_count.tmp

if [ "$BROKEN_UNIQUE" -gt 0 ]; then
    echo ""
    echo "❌ TEST FAILED: $BROKEN_UNIQUE broken image(s) found"
    exit 1
else
    echo ""
    echo "✅ TEST PASSED: All local images resolve correctly!"
    exit 0
fi
