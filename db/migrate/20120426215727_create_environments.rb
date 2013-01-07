class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.string :label
      t.string :url

      t.timestamps
    end
  end
end
