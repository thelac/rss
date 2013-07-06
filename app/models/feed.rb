class Feed < ActiveRecord::Base
  attr_accessible :description, :link, :title
  has_many :items
end
