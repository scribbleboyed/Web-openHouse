class Event < ActiveRecord::Base
	belongs_to :agent
	belongs_to :listing
	belongs_to :prospect
	has_many :agents, through: :event_agents
end
