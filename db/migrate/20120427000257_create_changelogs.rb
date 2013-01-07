class CreateChangelogs < ActiveRecord::Migration
  def change
    create_table :changelogs do |t|
      t.references :version
      t.text :text

      t.timestamps
    end
    add_index :changelogs, :version_id
  end
end
