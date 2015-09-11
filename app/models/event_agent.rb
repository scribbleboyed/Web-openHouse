class EventAgent < ActiveRecord::Base
  belongs_to :event
  belongs_to :agent
end
