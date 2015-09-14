class Prospect < ActiveRecord::Base
  belongs_to :open_house
  has_many :events
  
	def full_name
		"#{first_name} #{last_name}"
	end
end
