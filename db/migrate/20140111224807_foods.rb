class Foods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
    t.string :name, null:false
    t.string :comments
    t.integer :event_id
    t.integer :user_id
    t.integer :category_id
    end
  end
end
