Description
===========

Live example for [jsus](https://github.com/markiz/jsus) rack middleware.

Installation
============

1. `bundle install`
2. `rackup`
3. Go to [http://localhost:9292/javascripts/jsus/require/CKEditor](http://localhost:9292/javascripts/jsus/require/CKEditor)
and see the file being built
4. Experiment with urls. E.g.: /javascripts/jsus/require/CKEditor:plugins.about.plugin+CKEditor:plugins.adobeair.plugin.js


Things to notice
================

Caching is on by default, but sinatra lets middleware do its work before serving
static files. This leads to regeneration per request. Use caching proxy, like
kick-ass [nginx](http://nginx.org/) before your sinatra in order to succeed.


License
=======

Application and libraries: UNLICENSE, same as jsus.

CKEditor and other files: look in the respective sources.