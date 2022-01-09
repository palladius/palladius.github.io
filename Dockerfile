FROM jekyll/jekyll:4.2.0 as base 


# Install imagemagick for your system (e.g. apt-get install imagemagick for Linux or brew install imagemagick on macOS)
# if u use https://github.com/aerobless/jekyll-photo-gallery
# which doesnt support Jekyll 4.0 only 3.x

# npm install -g bower
# bower install jquery lightgallery isotope

RUN touch /riccardo-website.touch 
RUN mkdir -p /srv/jekyll
ADD blog/Gemfile /srv/jekyll
ADD blog/Gemfile.lock /srv/jekyll
 
RUN pwd
RUN ls
RUN df -h
RUN bundle install 

ADD ./blog/ /srv/jekyll

#ENTRYPOINT /sreccardo-blog-jekyll//entrypoint-8080.sh
