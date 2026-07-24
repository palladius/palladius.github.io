Welcome to Riccardo test on Hugo + Netlify.

* Self (prod): https://hugo-stack.ricc.rocks
* Self: (dev): https://master--timely-bombolone-ae5bc6.netlify.app/ or
  https://timely-bombolone-ae5bc6.netlify.app/

[![Netlify Status](https://api.netlify.com/api/v1/badges/05edf93f-0b88-45b2-a166-318956c87756/deploy-status)](https://app.netlify.com/sites/timely-bombolone-ae5bc6/deploys)


Currently it all works locally, but in the cloud... (seems the beginning of a fun PEBCAK story)...
I got 404.

https://answers.netlify.com/t/support-guide-i-ve-deployed-my-site-but-i-still-see-page-not-found/125?utm_source=404page&utm_campaign=community_tracking

WTF is the  /index.html ?!?

The working version has:
* basedir: not set.
* build command: hugo
* publish directory: public


## Thanks

* Jimmy for the Hugo [stack](https://github.com/CaiJimmy/hugo-theme-stack) module.
