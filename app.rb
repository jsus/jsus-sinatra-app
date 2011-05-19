require 'rubygems'
require 'bundler'
Bundler.setup(:default, :development)
require 'jsus'
require 'sinatra/base'

Jsus::Middleware.settings = {
  :cache        => true,
  :cache_path   => File.expand_path("../public/javascripts/jsus/require", __FILE__),
  :packages_dir => File.expand_path("../vendor/js", __FILE__),
  :cache_pool   => false
}

class Jsus::HackedMiddleware < Jsus::Middleware
  def get_associated_files(tag)
    if !tag.kind_of?(String) || tag.index("/")
      super
    else
      super("**/#{tag}")
    end
  end
end

class JsusApplication < Sinatra::Base
  use Jsus::HackedMiddleware
  set :static, true
  get '/' do
    [
      200, {"Content-Type" => "text/plain"},
      "Ping! Use jsus urls to see some magic.\n\n"    <<
      "E.g.: /javascripts/jsus/require/CKEditor.js\n" <<
      "/javascripts/jsus/require/CKEditor~CKEditor:core.config~CKEditor:core.command.js\n" <<
      "/javascripts/jsus/require/CKEditor:plugins.div.plugin+CKEditor:plugins.domiterator.plugin.js\n" <<
      "Or even: /javascripts/jsus/require/**:*undo*.js\n"
    ]
  end
end # class JsusApplication
