require 'rails/generators'

module Spotlight
  ##
  # spotlight:tamu generator
  class Tamu < Rails::Generators::Base
    source_root File.expand_path('../tamu', __FILE__)

    def tamu_customizations
      directory 'app', 'app'
      directory 'config', 'config'
      directory 'db', 'db'
      directory 'locales', 'public/locales'
    end

    def tinymce_rails
      gem 'tinymce-rails'
    end

    def mirador_rails
      gem 'mirador_rails'
    end
  end
end
