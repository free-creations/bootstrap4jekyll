# frozen_string_literal: true

require 'bootstrap4jekyll/version'
require 'bootstrap4jekyll/hook'

#
# Register a hook that becomes active just after the site initializes, but before setup & render.
# @type [Jekyll::Site] site_config Site wide information and configuration settings from _config.yml.
Jekyll::Hooks.register :site, :after_init do |site_config|
  Bootstrap4jekyll::Hook.register_bootstrap(site_config)
end
