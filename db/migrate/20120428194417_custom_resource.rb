class CustomResource < ActiveRecord::Migration
  def change
    change_table :resources do |t|
      t.text :description
    end
  end
end
