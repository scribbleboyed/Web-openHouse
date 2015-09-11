class Prospect < ActiveRecord::Base
  belongs_to :open_house
  has_many :events, through: :event_prospects
end
