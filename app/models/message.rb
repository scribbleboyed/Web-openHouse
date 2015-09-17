class Message < ActiveRecord::Base
  belongs_to :agent
  belongs_to :chat
end
