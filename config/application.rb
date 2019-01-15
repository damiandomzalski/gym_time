require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module GymTime
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators.test_framework false
    config.assets.debug = false
    config.assets.raise_runtime_errors = false
  end
end
