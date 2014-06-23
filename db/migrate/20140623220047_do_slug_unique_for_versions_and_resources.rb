class DoSlugUniqueForVersionsAndResources < ActiveRecord::Migration
  def up
    add_index :versions, :slug, unique: true
    add_index :resources, [:slug, :version_id], unique: true
  end

  def down
    remove_index :resources, column: [:slug, :version_id]
    remove_index :versions, column: :slug
  end
end
