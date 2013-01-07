class AddSlugs < ActiveRecord::Migration
  def change
    change_table :versions do |t|
      t.string :slug
    end
    change_table :services do |t|
      t.string :slug
    end
  end
end
