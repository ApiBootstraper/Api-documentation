class ChangelogsController < ApplicationController

  def show
    @version = Version.find_by_slug!(params[:version])
    add_breadcrumb 'REST API', 'rest_path'
    add_breadcrumb @version.name, url_for(:action => 'show', :controller => 'versions', :version => @version.slug)
    add_breadcrumb 'Changelog'
  end

end
