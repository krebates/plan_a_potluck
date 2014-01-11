class Events < ActiveRecord::Migration
  def change
    create_table :events do |t|
    t.string :event_name, null:false
    t.string :street_address, null:false
    t.string :apt_number
    t.string :city, null:false
    t.string :state, null:false
    t.string :zip_code
    t.string :phone_number
    t.integer :user_id
    t.timestamps
    end
  end
end
