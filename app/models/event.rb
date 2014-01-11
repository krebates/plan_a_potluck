class Event < ActiveRecord::Base


  validates_presence_of(:street_address)
  validates_presence_of(:city)
  validates_presence_of(:zip_code)
  validates_length_of :zip_code, is: 5
  has_many :categories, inverse_of: :event
  has_many :food, through: :categories

end
