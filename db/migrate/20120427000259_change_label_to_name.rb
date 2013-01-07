class ChangeLabelToName < ActiveRecord::Migration
  def change
    rename_column :versions, :label, :name
    rename_column :environments, :label, :name
    rename_column :services, :route, :name
  end
end
