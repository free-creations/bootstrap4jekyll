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

    # The assets delivered together with the bootstrap GEM will be added to the site.
    def add_bootstrap_assets(site)
      site.static_files.concat jekyllized_bootstrap_files(site) if assets_enabled?(site)
    end

    private

    # @return [Boolean] true if the user has chosen to include the bootstrap assets to his site.
    def assets_enabled?(site)
      return false unless site.config['bootstrap']

      site.config['bootstrap']['assets'] == true
    end

    # Create a Jekyll::StaticFile for each bootstrap file and assemble them into an array.
    # @return [Array<Jekyll::StaticFile>] the extra assets that should be included
    #                                     in the generated site.
    def jekyllized_bootstrap_files(site)
      source = File.dirname(bootstrap_assets_path)
      bootstrap_asset_files.map do |file|
        dir = File.dirname(file)
        file_name = File.basename(file)
        Jekyll::StaticFile.new site, source, dir, file_name
      end
    end

    # Scans the bootstrap GEM and creates an array files-paths that should be included
    # in the generated site.
    #
    # @return [Array<String>]  an array files-paths that should be included
    #                          in the generated site.
    def bootstrap_asset_files
      asset_files = []
      Find.find(bootstrap_assets_path).each do |path|
        next if File.directory?(path)
        next if path.include?(stylesheets_path) # do not include the scss files

        asset_files << path.sub(bootstrap_assets_path, 'assets')
      end
      asset_files
    end

    # @return [String] Absolute path to the assets distributed together with the bootstrap GEM.
    def bootstrap_assets_path
      @bootstrap_assets_path ||= ::Bootstrap.assets_path
    end

    # @return [String] Absolute path to the scss partials distributed together with the bootstrap GEM.
    def stylesheets_path
      @stylesheets_path ||= File.expand_path 'stylesheets/', bootstrap_assets_path
    end
  end
end
