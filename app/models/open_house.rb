class OpenHouse < ActiveRecord::Base
  belongs_to :listing
  belongs_to :agent
end
