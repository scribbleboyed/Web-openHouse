class Chat < ActiveRecord::Base
	has_many :messages
	has_many :agents, through: :chat_agents
end
