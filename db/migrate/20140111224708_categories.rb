class Categories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    t.string :name, null:false
    t.integer :event_id
    t.timestamps
    end
  end
end
