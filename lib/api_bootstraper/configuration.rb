require 'active_support/configurable'

module ApiBootstraper

  class << self
    # Global settings for ApiBootstraper
    def config
      @config ||= ApiBootstraper::Configuration
    end
  end

  class Configuration < Settingslogic
    source "#{Rails.root}/config/application.yml"
    namespace Rails.env

    suppress_errors Rails.env.production?
    load!
  end
end
