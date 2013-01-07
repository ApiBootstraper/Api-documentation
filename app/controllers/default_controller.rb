class DefaultController < ApplicationController

  def index
  end

  def rest
    add_breadcrumb 'REST API'
  end

end
