# Ricc Jekyll website

Dono un po' confuso da jekyll e o suoi file quindi ho messo tutto sotto BLOG.
Adesso fuori da li ci metto liberie di vendors, dockerizzazione etc. Ovviamente lascio dentro 
quelle piccole cose che dEVONO stare dentro come l'entrypoint per docker :)

## Image Gallery

https://olivierpieters.be/blog/2016/02/26/creating-a-jekyll-image-gallery

installa le dipendenze con bower:

```
First off, we need to install both libraries. You can do that on your own by downloading the source code on GitHub, but using a dependency manager is much easier. I will use bower. So run:

bower install jquery lightgallery isotope

There also is a save option (--save) ensures these dependencies are saved to a bower.json file. I configured bower to install these dependencies into my assets folder. You can do this by setting "directory" : "assets" in your .bowerrc file. This is the workflow followed in the Github repo.

After installing the dependencies, make sure you are using the latest version of Jekyll too, since what will follow has only been tested on Jekyll 3.0.1.
```

## dockerizzazione PROD

Penso che jekyll usi docker per fare una build CLEANc he poi mette i file statici. Una volta fatto jekyol non sserve piu a una cippa :)
fporse basta apche o nginx.

https://michaelsoolee.com/compile-jekyll-site-docker/

    docker run --rm -it --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" --env JEKYLL_ENV=production jekyll/jekyll:4.0 jekyll build

* usa docker per evitare di usare jekyll: utilissime idee e va letto tutto. https://dev.to/michael/compile-a-jekyll-project-without-installing-jekyll-or-ruby-by-using-docker-4184

## Altre idee

* dockerizza Jekyll con JRuby: Java.Graphviz/PlantUML: https://blog.frankel.ch/musings-dockerfile-jekyll/ usa jekylle  jruby, il tizio e' un genio. sito su gitlab.io (tipo github pages): https://nfrankel.gitlab.io/
* migra da wordpress a jekyll: https://github.com/some-programs/exitwp

## hosting

* github pages
* http://jekyllbootstrap.com/
* GCE:  dns-setup-palladius.sh blog.palladi.us 34.65.197.18

## Credits

* Olivier Pieters (me@olivierpieters.be') for his beautiful jekyll gallery which I'm using.