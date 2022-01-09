#!/bin/bash

yellow Ricky Devo farlo andare da directory blog/

#export JEKYLL_VERSION=3.8
export JEKYLL_VERSION=4.2.0
# available tags: https://hub.docker.com/r/jekyll/jekyll/tags

# docker run --rm \
#   --volume="$PWD/blog:/srv/jekyll" \
#   -it jekyll/jekyll:$JEKYLL_VERSION \
#   jekyll build

# 	bundle exec jekyll serve --livereload
(
  echo Try: jekyll build
  echo bundle exec jekyll serve --livereload
) | lolcat

docker run --rm -p 4001:4000 \
  --env-file docker-prod.env \
  --volume="$PWD/blog:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION bash 
