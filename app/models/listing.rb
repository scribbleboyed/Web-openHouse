class Listing < ActiveRecord::Base
  belongs_to :agent
  has_many :events
  has_many :open_houses

  def address
  	"#{address_1}, #{city}, #{state}, #{zip_code}"

  end
end
