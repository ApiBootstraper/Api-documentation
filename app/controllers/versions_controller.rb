class VersionsController < ApplicationController

  def show
    @version = Version.find(params[:version])
    add_breadcrumb 'REST API', 'rest_path'
    add_breadcrumb @version.name
  end

end
