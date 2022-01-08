---
layout: post
title:  "Ciao Alessandro!"
---

# Welcome

**Ciao a tutti**, this is my first Jekyll blog post.

I hope you like it!

{% post_url 2022-01-08-welcome-to-jekyll %}

prova post: https://jekyllrb.com/docs/liquid/tags/#linking-to-posts

-- @sreccardo

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


## prova immagini

{% assign image_files = site.static_files | where: "image", true %}
{% for myimage in image_files %}
  {{ myimage.path }}
{% endfor %}

## finbe immagini

![image tooltip here](/assets/riccardo.jpg)
