class Prospect < ActiveRecord::Base
  belongs_to :open_house
  has_many :events
end
