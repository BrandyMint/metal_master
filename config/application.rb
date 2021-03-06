require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MetalMaster
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    config.responders.flash_keys = [ :success, :warning ]
    config.i18n.default_locale = :ru

    # config.web_console.whitelisted_ips = '10.101.0.0/16, 192.168.0.0/16'
    config.web_console.whiny_requests = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
