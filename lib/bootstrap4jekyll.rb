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
  # but before setup and render.
  #
  # site gives access to the site-wide information
  # and configuration settings (mainly from _config.yml).
  Jekyll::Hooks.register :site, :after_init do |site|
    bootstrap_plugin.complete_load_paths(site)
  end
end
