
Dono un po' confuso da jekyll e o suoi file quindi ho messo tutto sotto BLOG.
Adesso fuori da li ci metto liberie di vendors, dockerizzazione etc. Ovviamente lascio dentro 
quelle piccole cose che dEVONO stare dentro come l'entrypoint per docker :)

# Image Gallery

https://olivierpieters.be/blog/2016/02/26/creating-a-jekyll-image-gallery

installa le dipendenze con bower:

```
First off, we need to install both libraries. You can do that on your own by downloading the source code on GitHub, but using a dependency manager is much easier. I will use bower. So run:

bower install jquery lightgallery isotope

There also is a save option (--save) ensures these dependencies are saved to a bower.json file. I configured bower to install these dependencies into my assets folder. You can do this by setting "directory" : "assets" in your .bowerrc file. This is the workflow followed in the Github repo.

After installing the dependencies, make sure you are using the latest version of Jekyll too, since what will follow has only been tested on Jekyll 3.0.1.
```