class Agent < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true, uniqueness: { case_sensitive: false}

	has_many :listings
	has_many :prospects
	has_many :open_houses
	has_many :events

	def full_name
      "#{first_name} #{last_name}"
    end
end
