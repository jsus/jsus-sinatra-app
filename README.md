Description
===========

Live example for [jsus](https://github.com/markiz/jsus) rack middleware.

Installation
============

1. `bundle install`
2.  `git submodule update --init`
3. `rackup`
4. Go to [http://localhost:9292/javascripts/jsus/require/CKEditor](http://localhost:9292/javascripts/jsus/require/CKEditor)
and see the file being built
5. Experiment with urls. E.g.: `/javascripts/jsus/require/CKEditor:plugins.about.plugin+CKEditor:plugins.adobeair.plugin.js`
5a. Wildcards also work! `/javascripts/jsus/require/**:*undo*.js`


Things to notice
================

Caching is on by default, but sinatra lets middleware do its work before serving
static files. This leads to regeneration per request. Use caching proxy, like
kick-ass [nginx](http://nginx.org/) before your sinatra in order to succeed.


License
=======

Application and libraries: UNLICENSE, same as jsus.

CKEditor and other files: look in the respective sources.
