ActiveAdmin.register Resource do
  menu :priority => 3

  config.sort_order = 'position_asc'

  # Collection action
  collection_action :sort, :method => :post do
    params[:resource].each_with_index do |id, index|
      Resource.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  # Listing view
  index do
    column("Version",  :sortable => :version) {|resource| link_to "#{resource.version.name}", admin_version_path(resource.version) }
    column("Resource", :sortable => :name)   {|resource| link_to "#{resource.name}", admin_resource_path(resource) }
    default_actions
  end

  # Form view
  form do |f|
    f.inputs do
      f.input :version_id,  :as => :select,      :collection => Version.all, :required => true
      f.input :name,        :as => :string
      f.input :description, :as => :string
    end
    f.buttons
  end

end
