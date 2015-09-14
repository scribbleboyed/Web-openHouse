class Agent < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true, uniqueness: { case_sensitive: false}

	has_many :listings
	has_many :prospects
	has_many :open_houses
	has_many :events, through: :event_agents
end
