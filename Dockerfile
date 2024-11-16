FROM jekyll/jekyll:4.2.0 as base


# Install imagemagick for your system (e.g. apt-get install imagemagick for Linux or brew install imagemagick on macOS)
# if u use https://github.com/aerobless/jekyll-photo-gallery
# which doesnt support Jekyll 4.0 only 3.x
ENV SITE_DIR=/srv/jekyll
# npm install -g bower
# bower install jquery lightgallery isotope

RUN touch /riccardo-website.touch
RUN mkdir -p $SITE_DIR
ADD blog/Gemfile $SITE_DIR
ADD blog/Gemfile.lock $SITE_DIR

RUN pwd
RUN ls
RUN df -h
RUN bundle install

ADD ./blog/ $SITE_DIR

RUN ls -al $SITE_DIR

# baco... forse questo pegggiora!
RUN cp ./blog/_includes/gallery-layout.html $SITE_DIR/_includes/
RUN cp ./blog/_includes/gallery-layout.html $SITE_DIR/

#ENTRYPOINT /sreccardo-blog-jekyll//entrypoint-8080.sh
