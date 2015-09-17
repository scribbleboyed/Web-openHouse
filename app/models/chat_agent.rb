class ChatAgent < ActiveRecord::Base
  belongs_to :chat
  belongs_to :agent
end
