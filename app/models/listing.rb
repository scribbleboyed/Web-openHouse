class Listing < ActiveRecord::Base
  belongs_to :agent
  has_many :events, through: :event_listings
  has_many :open_houses
end
