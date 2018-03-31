require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Basic
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    I18n.config.enforce_available_locales = false

    config.i18n.available_locales = ['zh-CN']
    config.i18n.default_locale = 'zh-CN'.to_sym
    config.before_configuration do
      I18n.locale = 'zh-CN'.to_sym
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '**', '*.{rb,yml}')]
      I18n.reload!
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '/api/*', headers: :any, methods: [:get, :post, :options, :put, :update, :delete]
      end
    end
    config.autoload_paths += Dir[Rails.root.join('app', 'models', 'ckeditor')]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
