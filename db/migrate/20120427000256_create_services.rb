class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :route
      t.integer :method
      t.string :summary
      t.references :version

      t.timestamps
    end
  end
end
