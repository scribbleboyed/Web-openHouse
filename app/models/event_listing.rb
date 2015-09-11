class EventListing < ActiveRecord::Base
  belongs_to :event
  belongs_to :listing
end
