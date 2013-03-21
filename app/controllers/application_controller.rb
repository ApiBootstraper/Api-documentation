class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate
  before_filter :navigation

protected
  def navigation
    @versions_all = Version.order("position ASC")
  end

  def add_breadcrumb name, url = ''
    @breadcrumbs ||= []
    url = eval(url) if url =~ /_path|_url|@/
    @breadcrumbs << [name, url]
  end

  def self.add_breadcrumb name, url, options = {}
    before_filter options do |controller|
      controller.send(:add_breadcrumb, name, url)
    end
  end

  def authenticate
    config     = ApiBootstraper.config.auth
    is_dev_env = (Rails.env.development? && ( request.host != "localhost" && !request.host.match(/.dev$/i) )) || !Rails.env.development?

    if config.enable == true && !is_dev_env
      authenticate_or_request_with_http_basic do |username, password|
        username == config.username && password == config.password
      end
    end
  end
end
