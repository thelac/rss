class Feed < ActiveRecord::Base
  attr_accessible :description, :link, :title, :user_id
  belongs_to :user
  has_many :items
end
