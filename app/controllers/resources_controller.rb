class ResourcesController < ApplicationController

  def show
    @resource = Resource.find_by_slug_and_version_id!(params[:resource], Version.find(params[:version]).id)
    add_breadcrumb 'REST API', 'rest_path'
    add_breadcrumb @resource.version.name, url_for(:action => 'show', :controller => 'versions', :version => @resource.version.slug)
    add_breadcrumb "#{@resource.name.titleize} services"
  end

end
