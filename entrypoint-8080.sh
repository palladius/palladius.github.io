#! /bin/bash

set -euo pipefail

# Possible RICCARDO_BLOG_URL: http://blog.palladi.us/ and https://sreccardo-blog.netlify.app/
echo "Benvenuti al entrypoint di Ricc sul suo blog personale: $RICCARDO_BLOG_URL"
echo "RICCARDO_FAVORITE_COLOR: $RICCARDO_FAVORITE_COLOR"

bundle exec jekyll build
bundle exec jekyll serve -P 8080 -s .
#--livereload
# in prod non faccio live relaod: bundle exec jekyll serve --livereload
