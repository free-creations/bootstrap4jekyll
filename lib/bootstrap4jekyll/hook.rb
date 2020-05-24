# frozen_string_literal: true

require 'jekyll/hooks'

module Bootstrap4jekyll
  class Hook
    #
    # @param [Jekyll::Site] site Site wide information and configuration settings from _config.yml.
    def self.register_bootstrap(site)
      config_source = site.config['source']
      warn "register_bootstrap for #{config_source}"
    end
  end
end
