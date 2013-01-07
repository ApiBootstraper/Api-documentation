class Ordering < ActiveRecord::Migration
  def change
    change_table :versions do |t|
      t.integer :position
    end
    change_table :resources do |t|
      t.integer :position
    end
    change_table :services do |t|
      t.integer :position
    end
  end
end
