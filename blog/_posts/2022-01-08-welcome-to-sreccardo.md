---
layout: post
title:  "Welcome to SREccardo!"
---

{% assign image_files = site.static_files | where: "image", true %}

2024: addon.

# Welcome

**Ciao a tutti**, this is my first Jekyll blog post.

I hope you like it!

{% post_url 2022-01-08-welcome-to-jekyll %}

prova post: https://jekyllrb.com/docs/liquid/tags/#linking-to-posts

-- @sreccardo

## Immagini di Alessandro:


Immagini di Alessandro:

{% for myimage in image_files %}
  {% if  myimage.path contains 'aj' -%}
      <img src="{{ myimage.path }}" height="200" alt="{{ myimage.path }}" />

  {% endif %}
{% endfor %}


## prova immagini


{% for myimage in image_files %}
  <img src="{{ myimage.path }}" height="80" alt="{{ myimage.path }}" />
  <!--
  {{ myimage.path }}
  #  ! [ metto altezza ] ( { { myimage.path } } )
  -->
{% endfor %}


## fine immagini

![image tooltip here](/assets/immagini/riccardume/riccardo.jpg)


## Why I love septober

    gem install ric

This will give you access to a Septober CLI which ibnterrogates a generic septober app I've written years ago.
You can find one here: `TODO(ricc)`

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

