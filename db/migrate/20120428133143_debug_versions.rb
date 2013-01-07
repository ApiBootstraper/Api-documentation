class DebugVersions < ActiveRecord::Migration
  def change
    rename_column :versions, :active, :is_active
    remove_column :versions, :url
  end
end
