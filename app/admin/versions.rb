ActiveAdmin.register Version do
  menu priority: 2
  permit_params :name, :is_active, :tags

  config.sort_order = 'position_asc'

  # Duplic version
  action_item only: [:show, :edit] do
    link_to "Copy", :clone_admin_version
  end
  member_action :clone, method: :get do
    version = Version.find(params[:id]).clone_with_associations
    version.name = "#{version.name} copy"
    version.save!

    redirect_to edit_admin_version_path(version), notice: "Duplicated!"
  end


  # Collection action
  collection_action :sort, method: :post do
    params[:version].each_with_index do |id, index|
      Version.update_all(['position=?', index+1], ['id=?', id])
    end
    render nothing: true
  end

  # Listing view
  index do
    column("Name", sortable: :name)   {|version| link_to "#{version.name}", admin_version_path(version) }
    default_actions
  end

  # Form view
  form do |f|
    f.inputs do
      f.input :name,        as: :string
      f.input :is_active
    end
    f.inputs "Tags" do
       f.input :tags, as: :check_boxes, collection: Tag.all
    end

    f.actions
  end

end
