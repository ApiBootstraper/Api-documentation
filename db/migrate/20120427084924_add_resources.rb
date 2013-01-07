class AddResources < ActiveRecord::Migration
  def change
    change_table :services do |t|
      t.remove :method, :summary
    end
    rename_table(:services, :resources)

    create_table :services do |t|
      t.references :resource
      t.string :name
      t.string :summary

      t.timestamps
    end
    add_index :services, :resource_id
  end
end
