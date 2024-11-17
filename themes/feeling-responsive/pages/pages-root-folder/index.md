---
#
# Use the widgets beneath and the content will be
# inserted automagically in the webpage. To make
# this work, you have to use › layout: frontpage
#
layout: frontpage
header:
  image_fullwidth: header_unsplash_12.jpg
widget1:
  title: "Blog & Portfolio"
  url: 'http://phlow.github.io/feeling-responsive/blog/' #
  image: widget-1-302x182.jpg
  text: 'Every good portfolio website has a blog with fresh news, thoughts and develop&shy;ments of your activities. <em>Feeling Responsive</em> offers you a fully functional blog with an archive page to give readers a quick overview of all your posts.'
widget2:
  title: "Art of SLOs model - E3ReKuJ8ewA"
  url: 'https://www.youtube.com/watch?v=E3ReKuJ8ewA'
  text: "The <em>Art of SLOs </em> is a workshop developed by Google's Customer Reliability Engineering team. The goal of the workshop is to introduce participants to the way Google measures service reliability—in terms of Service Level Indicators (SLIs) and Service Level Objectives (SLOs)—and give them some hands-on experience with creating these measures in practice. These are important, fundamental concepts: it is far easier to have a meaningful conversation about the reliability of a service when you have an objective way of measuring that reliability."
  video: '<a href="#" data-reveal-id="videoModal"><img src="https://lh3.googleusercontent.com/AYkOCZpaXliz5hZ0gAvfriWly6IjYlKrnn2MURM0arosMtjPQfPafA_Zt_1ndSUtMNVPRHdzQXMZFHKi-0RcccbzEcBqsQyQjD5IJE45ezrMLV40-D7X=w1490" width="302" height="182" alt=""/></a>'
widget3:
  title: "Download Theme"
  url: 'https://github.com/Phlow/feeling-responsive'
  image: widget-github-303x182.jpg
  text: '<em>Feeling Responsive</em> is free and licensed under a MIT License. Make it your own and start building. The code is well-documented and explains you how it works.'
#
# Use the call for action to show a button on the frontpage
#
# To make internal links, just use a permalink like this
# url: /getting-started/
#
# To style the button in different colors, use no value
# to use the main color or success, alert or secondary.
# To change colors see sass/_01_settings_colors.scss
#
callforaction:
  url: https://tinyletter.com/feeling-responsive
  text: Inform me about new updates and features ›
  style: alert
permalink: /index.html
#
# This is a nasty hack to make the navigation highlight
# this page as active in the topbar navigation
#
homepage: true
---

<div id="videoModal" class="reveal-modal large" data-reveal="">
  <div class="flex-video widescreen vimeo" style="display: block;">
    <iframe width="1280" height="720" src="https://www.youtube.com/embed/3b5zCFSmVvU" frameborder="0" allowfullscreen></iframe>
  </div>
  <a class="close-reveal-modal">&#215;</a>
</div>
