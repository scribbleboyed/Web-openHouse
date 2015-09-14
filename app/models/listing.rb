class Listing < ActiveRecord::Base
  belongs_to :agent
  has_many :events
  has_many :open_houses
end
