class Event < ActiveRecord::Base
	belongs_to :agent
	belongs_to :listing
	belongs_to :prospect
	has_many :agents, through: :event_agents
	has_many :listings, through: :event_listings
	has_many :prospects, through: :event_prospects
end
