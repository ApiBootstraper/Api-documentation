class GeneralUpdate < ActiveRecord::Migration
  def change
    change_table :versions do |t|
      t.boolean :active
    end

    create_table :parameters do |t|
      t.references :service
      t.boolean :is_required
      t.string  :name
      t.string  :format
      t.string  :default_value
      t.string  :value_format
      t.text    :description

      t.timestamps
    end
    add_index :parameters, :service_id

    create_table :examples do |t|
      t.references  :service
      t.string      :name
      t.text        :text
      t.text        :code

      t.timestamps
    end
    add_index :examples, :service_id

    create_table :errors do |t|
      t.references  :service
      t.string      :code
      t.string      :name

      t.timestamps
    end
    add_index :errors, :service_id
  end
end
