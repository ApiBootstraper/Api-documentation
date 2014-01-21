ActiveAdmin.register Changelog do
  menu :priority => 5

  # Listing view
  index do
    column("Version", :sortable => :version)   {|changelog| link_to "#{changelog.version.name}", admin_version_path(changelog.version) }
    default_actions
  end

  # Form view
  form do |f|
    f.inputs do
      f.input :version_id,  :as => :select,      :collection => Version.all, :required => true
      f.input :text,        :as => :text,        :label => "Changelog"
    end

    f.actions
  end

end
