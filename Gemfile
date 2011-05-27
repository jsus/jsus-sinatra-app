source :rubygems

# Use local clones if possible. Please note, this is NOT NECESSARY for your
# real application. It's only for ease of development.
def custom_gem(name, options = Hash.new)
  local_path = File.expand_path("../../#{name}", __FILE__)
  if ENV["USE_JSUS_CUSTOM_GEMS"] && File.directory?(local_path)
    gem name, options.merge(:path => local_path).delete_if { |key, _| [:git, :branch].include?(key) }
  else
    gem name, options
  end
end

gem "rack"
gem "sinatra"
custom_gem "jsus", :git => "git://github.com/jsus/jsus.git", :branch => "master"
