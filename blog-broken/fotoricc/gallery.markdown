---
layout: default
support: [jquery, gallery]
title: Ricc Gallery
---

<h1 class="gallery-title">{{ page.title }}</h1>

Questa cha banalmente il CONTENT. Di cosa, niusacciu.

{{ content }}

{% include gallery-layout.html gallery=site.data.galleries.micro-album-cuties %}
