
echo "Benvenuti al entrypoint di Ricc sul suo blog personale: $RICCARDO_BLOG_URL"
echo "RICCARDO_FAVORITE_COLOR: $RICCARDO_FAVORITE_COLOR"

jekyll build
bundle exec jekyll serve
#--livereload
# in prod non faccio live relaod: bundle exec jekyll serve --livereload