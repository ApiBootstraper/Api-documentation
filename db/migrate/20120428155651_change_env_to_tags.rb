class ChangeEnvToTags < ActiveRecord::Migration
  def change
    rename_table :environments, :tags
    rename_column :tags, :url, :color

    create_table :versions_tags, :id => false do |t|
      t.integer :version_id
      t.integer :tag_id
    end
   end 
end
