# frozen_string_literal: true

require 'jekyll/hooks'
require 'bootstrap4jekyll/version'
require 'bootstrap4jekyll/plugin'

#
# Adds the
# [Twitter Bootstrap](https://getbootstrap.com/)
# framework to your __Jekyll__ site.
module Bootstrap4jekyll
  bootstrap_plugin = Plugin.new

  #
  # Register a jekyll-hook that calls our plugin just after the site initializes,
  # but before setup and render. Here we add the bootstrap partials from the
  # the _Bootstrap Ruby Gem_ to the load path of sass.
  #
  Jekyll::Hooks.register :site, :after_init do |site|
    bootstrap_plugin.complete_load_paths(site)
  end
  #
  # Register a jekyll-hook that calls our plugin after rendering the whole site,
  # but before writing any files. Here we copy files found in the
  # the _Bootstrap Ruby Gem_ to the assets of our site.
  #
  Jekyll::Hooks.register :site, :post_render do |site|
    bootstrap_plugin.add_bootstrap_assets(site)
  end
end
