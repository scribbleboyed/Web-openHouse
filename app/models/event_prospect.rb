class EventProspect < ActiveRecord::Base
  belongs_to :event
  belongs_to :prospect
end
