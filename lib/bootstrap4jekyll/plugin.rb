# frozen_string_literal: true

# Require bootstrap to add bootstrap to SaSS's load path
require 'bootstrap'

module Bootstrap4jekyll
  # The plugin functionality that adds the _Twitter-Bootstrap-framework_ to the _Jekyll_ site.
  class Plugin
    # Add the paths of _bootstraps scss partials_ to the global _sass-load-path_.
    # @param [Jekyll::Site] site represents site-wide information and configuration settings.
    def complete_load_paths(site)
      # fetch the the path to the bootstrap partials.
      bootstrap_partials = File.expand_path('stylesheets/', ::Bootstrap.assets_path)

      # make sure there is a 'sass' key-entry in the config settings.
      site.config['sass'] = { 'load_paths' => [] } unless site.config['sass']
      sass_config = site.config['sass']

      # make sure that the sass_config has a 'load_paths' key-entry.
      sass_config['load_paths'] = [] unless sass_config['load_paths']
      # make sure that the 'load_paths' entry is an array and not just a string
      sass_config['load_paths'] = Array(sass_config['load_paths'])
      # add the bootstrap partials to the sass-load-paths
      sass_config['load_paths'] << bootstrap_partials
    end
  end
end
