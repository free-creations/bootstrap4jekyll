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
      site.config['sass'] = {'load_paths' => []} unless site.config['sass']
      sass_config = site.config['sass']

      # make sure that the sass_config has a 'load_paths' key-entry.
      sass_config['load_paths'] = [] unless sass_config['load_paths']
      # make sure that the 'load_paths' entry is an array and not just a string
      sass_config['load_paths'] = Array(sass_config['load_paths'])
      # add the bootstrap partials to the sass-load-paths
      sass_config['load_paths'] << bootstrap_partials
    end

    def add_extra_assets(site)
      @site ||= site
      if assets_enabled?(site)

        xxx = static_files
        site.static_files.concat xxx
      end
    end

    private

    def assets_enabled?(site)
      return false unless site.config['bootstrap']
      site.config['bootstrap']['assets'] == true
    end




    # Returns an array of Jekyll::StaticFile instances for each file
    # in asset_files. Files are prefixed with an `assets/` directory
    def static_files
      source = File.dirname(assets_path)
      asset_files.map do |file|
        dir = File.dirname(file)
        file_name = File.basename(file)
        Jekyll::StaticFile.new @site, source, dir, file_name
      end
    end

    # Return an array of paths to static files that should be included
    # in the generated site.
    #
    # Note: All paths are relative to the assets_path directory
    def asset_files
      asset_files = []
      Find.find(assets_path).each do |path|
        next if File.directory?(path)
        next if path.include?(stylesheets_path) || path.include?(images_path)
        asset_files << path.sub(assets_path, 'assets')
      end
      asset_files
    end

    # Absolute path to bootstrap-sass's vendored static assets
    def assets_path
      @assets_path ||= ::Bootstrap.assets_path
    end
    # Absolute path to bootstrap-sass's images directory
    # Which should be excluded because it's empty
    def images_path
      @imags_path ||= File.expand_path 'images/', assets_path
    end

    # Absolute path to bootstrap-sass's stylesheets directory
    # Which should be excluded because it's processed by SaSS
    def stylesheets_path
      @stylesheets_path ||= File.expand_path 'stylesheets/', assets_path
    end
  end

end
