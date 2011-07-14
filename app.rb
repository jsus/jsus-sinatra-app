require 'rubygems'
require 'bundler'
Bundler.setup(:default, :development)
require 'jsus'
require 'sinatra/base'

Jsus::Middleware.settings = {
  :cache         => true,
  :cache_path    => File.expand_path("../public/javascripts/jsus", __FILE__),
  :packages_dir  => File.expand_path("../vendor/js", __FILE__),
  :cache_pool    => false,
  :includes_root => File.expand_path("../vendor/js", __FILE__),
  :log_method    => :console
}
Jsus.verbose = true

class JsusApplication < Sinatra::Base
  use Jsus::Middleware


  set :static,  true
  get '/' do
    [
      200, {"Content-Type" => "text/plain"},
      "Ping! Use jsus urls to see some magic.\n\n"    <<
      "E.g.: /javascripts/jsus/require/CKEditor.js\n" <<
      "/javascripts/jsus/include/CKEditor.js\n"       <<
      "/javascripts/jsus/require/CKEditor~CKEditor:core.config~CKEditor:core.command.js\n"             <<
      "/javascripts/jsus/require/CKEditor:plugins.div.plugin+CKEditor:plugins.domiterator.plugin.js\n" <<
      "Or even: /javascripts/jsus/require/**:*undo*.js\n"
    ]
  end
end # class JsusApplication
