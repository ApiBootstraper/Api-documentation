ActiveAdmin.register Service do
  menu :priority => 4

  config.sort_order = 'position_asc'

  # Duplic version
  action_item :only => [:show, :edit] do
    link_to "Copy", :clone_admin_service
  end
  member_action :clone, :method => :get do
    service = Service.find(params[:id]).clone_with_associations
    service.name = "#{service.name} copy"
    service.save!

    redirect_to edit_admin_service_path(service), :notice => "Duplicated!"
  end

  # Collection action
  collection_action :sort, :method => :post do
    params[:service].each_with_index do |id, index|
      Service.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  # Listing view
  index do
    column("Version", :sortable => :version)      {|s| link_to "#{s.resource.version.name}", admin_versions_path(s.resource.version) }
    column("Resource", :sortable => :name)        {|s| link_to "#{s.resource.name}", admin_resource_path(s.resource) }
    column("Path", :sortable => :name)            {|s| link_to "#{s.name}", admin_service_path(s) }
    column("Method", :sortable => :name)          {|s| "#{s.http_method}" }
    column("Summary", :sortable => :name)         {|s| "#{s.summary}" }
    default_actions
  end

  # Form view
  # form :partial => "form"
  form do |f|
    f.inputs  do
        f.input :resource_id,   :as => :select,      :collection => Hash[Resource.all.map{|r| ["#{r.version.name} - #{r.name}",r.id]}], :required => true
        f.input :name,          :as => :string,      :label => "Path"
        f.input :summary,       :as => :string
        f.input :http_method,   :as => :select,      :collection => ["GET", "POST", "PUT", "PATCH", "DELETE"], :required => true
        f.input :note,          :as => :text
        f.input :example_note,  :as => :text
        f.input :auth_required
    end

    # f.inputs "Parameters" do
      f.has_many :parameters do |p|
        p.input :name
        p.input :is_required
        p.input :format,        :as => :select,      :collection => ["path", "body", "query"], :required => true
        p.input :default_value
        p.input :value_format,  :as => :select,      :collection => ["UUID", "String", "Integer", "Float", "Decimal", "Datetime"], :required => true
        p.input :description,   :as => :string

        unless p.object_id.nil?
          p.input :_destroy, :as => :boolean, :label => "Delete"
        end
      end
    # end

    f.has_many :examples do |e|
      e.input :name
      e.input :text
      e.input :code

      unless e.object_id.nil?
        e.input :_destroy, :as => :boolean, :label => "Delete"
      end
    end

    f.has_many :http_errors do |h|
      h.input :code
      h.input :name, :label => "Reason"

      unless h.object_id.nil?
        h.input :_destroy, :as => :boolean, :label => "Delete"
      end
    end

    f.buttons
  end

end
