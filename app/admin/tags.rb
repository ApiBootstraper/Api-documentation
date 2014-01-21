ActiveAdmin.register Tag do
  actions :index, :new, :create, :edit, :update, :destroy
  permit_params :name, :color

  # Listing view
  index do
    column("Name", sortable: :name)        {|t| link_to "#{t.name}", admin_tag_path(t) }
    default_actions
  end

  # Form view
  form do |f|
    f.inputs do
      f.input :name,  as: :string
      f.input :color, as: :select, collection: {"yellow" => "warning", "red" => "important", "green" => "success", "blue" => "info", "black" => "inverse"}
    end

    f.actions
  end

end
