class UpdateServices < ActiveRecord::Migration
  def change
    change_table :services do |t|
      t.string  :http_method
      t.text    :note
      t.boolean :auth_required
      t.text    :example_note
    end
  end
end
